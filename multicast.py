import os
import re
import time
import json
import socket
import requests
import subprocess
import tools
import urllib.parse
import urllib.request
import mysql.connector
from bs4 import BeautifulSoup
from datetime import datetime
from urllib.parse import urlparse
from mysql.connector import pooling
from requests.exceptions import RequestException

# 创建连接池
connection_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="iptv_pool",
    pool_size=10,
    host='192.168.199.119',
    user='iptv',
    password='iptv',
    database='iptv'
)

def process_channels(data_list):
    # 获取当前时间
    current_time = datetime.now()
    line_count = len(data_list)
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()

        # 如果数据库中存在相同的URL，若无则插入数据到数据库
        insert_sql = "INSERT INTO iptv_channels (name, url, type, speed, sign) VALUES (%s, %s, %s, %s, %s)"
        # 执行批量插入操作
        cursor.executemany(insert_sql, data_list)
        cnx.commit()
        print(f"{current_time} 共 {line_count} 行数据, 批量地址入库提交成功")
    except mysql.connector.Error as e:
        print(f"{current_time} 共 {line_count} 行数据, 插入数据时发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def process_udpxys(flag, data_list):
    # 获取当前时间
    current_time = datetime.now()
    line_count = len(data_list)
    if line_count == 0:
        return
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        process_type = "批量插入"
        # 如果数据库中存在相同的URL，若无则插入数据到数据库
        process_sql = "INSERT INTO iptv_udpxy (id, mid, mcast, city, ip, port, actv, status, time) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);"
        if flag == 2:
            process_sql = "UPDATE iptv_udpxy SET actv = %s, status = %s, time = %s WHERE id = %s;"
            process_type = "批量更新"
        # 执行批量插入操作
        cursor.executemany(process_sql, data_list)
        cnx.commit()
        print(f"{current_time} 共 {line_count} 行数据, {process_type}提交成功")
    except mysql.connector.Error as e:
        print(f"{current_time} 共 {line_count} 行数据, {process_type}时发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def process_multicast(data_list):
    # 获取当前时间
    current_time = datetime.now()
    line_count = len(data_list)
    if line_count == 0:
        return
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        # 处理类型
        process_type = "批量更新"
        # 处理sql
        process_sql = "UPDATE iptv_multicast SET city = %s, udpxy = %s, `lines` = %s, status = %s, time = %s WHERE id = %s;"
        # 执行批量插入操作
        cursor.executemany(process_sql, data_list)
        cnx.commit()
        print(f"{current_time} 共 {line_count} 行数据, {process_type}提交成功")
    except mysql.connector.Error as e:
        print(f"{current_time} 共 {line_count} 行数据, {process_type}时发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def multicast_udpxy():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    # 调用360网络测绘接口
    api_url="https://quake.360.net/api/v3/search/quake_service"
    api_token="你自己https://quake.360.net的token"
    
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        query_multicast = "SELECT id, country, province, isp FROM iptv_multicast WHERE isp is not NULL and isp <> '';"
        cursor.execute(query_multicast)
        # 获取所有结果
        multicast_list = cursor.fetchall()
        multicast_update_list = []
        
        # 循环处理组播列表信息
        for multicast in multicast_list:
            mid = multicast[0]
            country = multicast[1]
            province = multicast[2]
            isp = multicast[3]
            mcast = province + "-" + isp
            
            # 查询组播有效的代理数量
            query_sql = "SELECT id, ip, port, actv, status FROM iptv_udpxy WHERE mid = %s and status = 1;"
            cursor.execute(query_sql, (mid,))
            # 获取所有结果
            udpxy_list = cursor.fetchall()
            udpxy_update_list = []
            # 循环处理组播列表信息
            for udpxy_info in udpxy_list:
                # 获取当前时间
                current_time = datetime.now()
                id = udpxy_info[0]
                ip = udpxy_info[1]
                port = udpxy_info[2]
                actv = 0
                status = 0
                status_url = "http://" + ip + ":" + str(port) + "/status"
                status_response = T.request_body(status_url)
                client_table = None
                if status_response is not None:
                    # 处理响应
                    status_response.raise_for_status()
                    # 检查请求是否成功
                    html_content = status_response.text
                    # 使用BeautifulSoup解析网页内容
                    soup = BeautifulSoup(html_content, "html.parser")
                    client_table = soup.find('table', attrs={'cellspacing': '0'})
                # 如果找到了目标表格
                if client_table:
                    # 找到所有的<td>标签
                    td_tags = client_table.find_all('td')
                    # 获取第四个<td>标签中的内容
                    addr = td_tags[2].text
                    # print(f"{current_time} udp mcast：{mcast}，addr：{addr}")
                    actv = int(td_tags[3].text)
                    # if '0.0.0' not in addr and '192.168' not in addr
                    status = 1
                udpxy_update_list.append((actv, status, current_time, id))
                print(f"{current_time} udp更新 mcast：{mcast}，mid：{mid}，actv：{actv}，status：{status}")
            
            # 更新udp代理至数据库
            process_udpxys(2, udpxy_update_list)
        
            # 删除无效udpxy信息
            delete_udpxy = "DELETE from iptv_udpxy WHERE mid = %s and status = 0;"
            cursor.execute(delete_udpxy, (mid,))
            cnx.commit()
            
            # 获取删除数据的条数
            deleted_rows = cursor.rowcount
            print(f"{current_time} mid：{mid}，mcast：{mcast}，删除无效数据：{deleted_rows}")
            
            # 查询组播有效的代理数量
            query_sql = "SELECT count(*) FROM iptv_udpxy WHERE mid = %s and status = 1;"
            cursor.execute(query_sql, (mid,))
            # 获取查询结果
            valid_count = cursor.fetchone()[0]
            
            start_index = 0
            page_count = 1
            insert_count = 0
            udpxy_insert_list = []
            while start_index <= page_count and start_index < 3 and valid_count + insert_count < 6:
                print(f"{current_time} mcast:{mcast} start_index:{start_index} page_count:{page_count} valid_count:{valid_count}")
                page_size = 10
                
                headers = {
                    "X-QuakeToken": api_token,
                    "Content-Type": "application/json"
                }
                
                data = {
                     "query": f"udpxy AND country_cn: \"{country}\" AND province_cn: \"{province}\" AND isp: \"{isp}\"",
                     "start": start_index, "size": page_size, "ignore_cache": False, "latest":True, "include": ["ip", "port", "location.city_cn"], "shortcuts": ["610ce2adb1a2e3e1632e67b2"]
                }
                # print(f"{current_time} data {data}")
                # 获取响应结果
                response = requests.post(url=api_url, headers=headers, json=data)
                # 解析JSON数据
                json_data = response.json()
                # print(f"{current_time} json_data: {json_data}")
                # 获取count的值
                success_code = json_data['code']
                if success_code == 0:
                    # 获取当前时间
                    current_time = datetime.now()
                    page_size = json_data["meta"]["pagination"]["page_size"]
                    total = json_data["meta"]["pagination"]["total"]
                    page_count = total/page_size
                    data_list = json_data["data"]
                    for item in data_list:
                        id = item["id"]
                        ip = item["ip"]
                        port = item["port"]
                        city = item["location"]["city_cn"]
                        actv = 0
                        status = 0
                        status_url = "http://" + ip + ":" + str(port) + "/status"
                        status_response = T.request_body(status_url)
                        client_table = None
                        if status_response is not None:
                            # 处理响应
                            status_response.raise_for_status()
                            # 检查请求是否成功
                            html_content = status_response.text
                            # 使用BeautifulSoup解析网页内容
                            soup = BeautifulSoup(html_content, "html.parser")
                            client_table = soup.find('table', attrs={'cellspacing': '0'})
                            # print(f"{current_time} client_table：{client_table}")
                        # 如果找到了目标表格
                        if client_table:
                            # 找到所有的<td>标签
                            td_tags = client_table.find_all('td')
                            # 获取第四个<td>标签中的内容
                            actv = int(td_tags[3].text)
                            status = 1
                        # 检查udp代理是否存在
                        check_sql = "SELECT count(*) FROM iptv_udpxy WHERE id = %s"
                        cursor.execute(check_sql, (id,))
                        # 获取查询结果
                        is_exist = cursor.fetchone()[0] > 0
                        if not is_exist and id not in (info[0] for info in udpxy_insert_list):
                            # 将数据添加到插入列表
                            udpxy_insert_list.append((id, mid, mcast, city, ip, port, actv, status, current_time))
                            print(f"{current_time} udp新增 mcast：{mcast}，id：{id}，actv：{actv}，status：{status}")
                            insert_count += status
                # 接口翻页查询
                start_index += 1
            # 插入udp代理至数据库
            process_udpxys(1, udpxy_insert_list)
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def multicast_channel():
    # 组播资源
    sign = 2
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        query_name = "SELECT psw, name, type FROM iptv_category WHERE enable = 1 ORDER BY id DESC;"
        cursor.execute(query_name)
        # 获取所有结果
        category_list = cursor.fetchall()
        
        query_multicast = "SELECT id, country, province, isp, path, city, udpxy FROM iptv_multicast WHERE isp is not NULL and isp <> '';"
        cursor.execute(query_multicast)
        # 获取所有结果
        multicast_list = cursor.fetchall()
        
        # 循环处理组播列表信息
        for multicast in multicast_list:
            # 获取当前时间
            current_time = datetime.now()
            multicast_update_list = []
            mid = multicast[0]
            country = multicast[1]
            province = multicast[2]
            isp = multicast[3]
            mcast = province + "-" + isp
            file_path = multicast[4]
            if file_path.endswith('.m3u'):
                file_path = T.convertToTxt(file_path)
            str_city = multicast[5]
            str_udpxy = multicast[6]
            # 将元组转换为列表
            ip_list = str_udpxy.split(',')
            city_list = str_city.split(',')
            lines = 0
            status = 0
            str_udpxy = ''
            str_city = ''
            for i, udpxy in enumerate(ip_list):
                if udpxy is None and udpxy == "":
                    continue
                # 查询酒店源数量
                query_sql = f"SELECT count(*) FROM iptv_channels WHERE url like %s and sign = {sign};"
                cursor.execute(query_sql, ('%' + udpxy + '%',))
                # 获取查询结果
                valid_count = cursor.fetchone()[0]
                
                # 获取当前时间
                current_time = datetime.now()
                if lines >= 3:
                    break
                # udpxy的城市
                city = city_list[i]
                
                index = 0
                error_cnt = 0
                speed = 0.00
                sum_speed = 0.00
                # 打开包含数据的文件
                with open(file_path, 'r') as file:
                    data_list = []
                    number = 0
                    for i, line in enumerate(file):
                        # 获取当前时间
                        current_time = datetime.now()
                        line = line.strip()
                        if ',' not in line or 'CAVS' in line or '测试' in line:
                            print(f"{current_time} 第 {i} 行数据，不包含逗号或无效频道，跳过处理")
                            continue
        
                        # 提取两列数据
                        source_data = line.split(',')
                        m3u8_name = source_data[0]
                        m3u8_name = m3u8_name[:m3u8_name.index('[')] if '[' in m3u8_name else m3u8_name
                        m3u8_name = m3u8_name.replace("HD", "").replace("标清", "").replace("超高清", "4K").replace("高清", "").replace("超清", "")
                        m3u8_name = m3u8_name.replace("#EXTINF-1", "")
                        m3u8_links = source_data[1]
                        # print(f"index：{index}，频道 {m3u8_name}，地址 [{m3u8_links}]")
                        
                        m3u8_values = m3u8_links.split('#')
                        if m3u8_links != "" and len(m3u8_values) > 0:
                            # 循环处理每个#分割结果
                            for m3u8_link in m3u8_values:
                                # 去掉$之后的字符
                                if "$" in m3u8_link:
                                    m3u8_link = m3u8_link.split("$")[0]
                                m3u8_link = T.get_multicast_addr(m3u8_link)
                                if m3u8_link is None:
                                    continue
                                index += 1
                                if index > 3 and error_cnt >= 3:
                                    break
                                m3u8_link = udpxy + "/rtp/" + m3u8_link
                                
                                # 匹配频道类型
                                category = T.get_category(m3u8_name, category_list)
                                # 获取频道分类
                                category_type = category[1]
                                if category_type is not None:
                                    # 获取频道名称
                                    m3u8_name = category[0]
                                if T.valid_url(m3u8_link, 15):
                                    data_info = (m3u8_name, m3u8_link)
                                    speed = 0.00
                                    if index <= 3:
                                        speed = T.get_ffmpeg_speed(m3u8_link)
                                        speed = 0.00 if speed < 5.00 else speed
                                        if speed == 0.00:
                                            error_cnt += 1
                                            print(f"{current_time} 第{index}条数据地址播放无效，频道名称：{m3u8_name}，频道类型: {category_type}，无效地址: {m3u8_link}")
                                        else:
                                            sum_speed += speed
                                    else:
                                        speed = round(sum_speed/(3 - error_cnt), 2)
                                    
                                    if valid_count == 0 and not any(info[:2] == data_info[:2] for info in data_list):
                                        # 将数据添加到列表
                                        data_list.append((m3u8_name, m3u8_link, category_type, speed, sign))
                                        print(f"{current_time} 第{index}条数据有效，频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}，播放速度: {speed} Mbps")
                                        number += 1
                                    else: 
                                        # print(f"{current_time} 第{index}条数据频道信息重复，频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}")
                                        continue
                                else: 
                                    if index <= 3:
                                        error_cnt += 1
                                        print(f"{current_time} 第{index}条数据频道地址无效，频道名称：{m3u8_name}，频道类型: {category_type}，无效地址: {m3u8_link}")
                                    continue
                if error_cnt < 3 and udpxy not in str_udpxy:
                    # 不存在频道表
                    if valid_count > 0:
                        lines += 1
                        str_city += ',' + city
                        str_udpxy += ',' + udpxy
                        # 去掉开头的逗号
                        str_city = str_city[1:] if str_city.startswith(',') else str_city
                        str_udpxy = str_udpxy[1:] if str_udpxy.startswith(',') else str_udpxy
                    print(f"{current_time} 组播代理udpxy：{udpxy}，待修改频道播放速度{speed}")
                else:
                    # 存在频道表
                    if valid_count > 0:
                        # 删除频道信息
                        delete_channel = f"DELETE from iptv_channels WHERE url like %s and sign = {sign};"
                        cursor.execute(delete_channel, ('%' + udpxy + '%',))
                        cnx.commit()
                        print(f"{current_time} 组播代理udpxy：{udpxy}，无效频道已删除")
            
            # 新增检测
            # 查询组播有效的代理
            query_sql = "SELECT id, city, ip, port, actv, status FROM iptv_udpxy WHERE mid = %s and status = 1 ORDER BY actv ASC, time DESC;"
            cursor.execute(query_sql, (mid,))
            # 获取所有结果
            udpxy_list = cursor.fetchall()
            # 循环处理组播列表信息
            for udpxy_info in udpxy_list:
                # 获取当前时间
                current_time = datetime.now()
                if lines >= 3:
                    break
                
                id = udpxy_info[0]
                city = udpxy_info[1]
                ip = udpxy_info[2]
                port = udpxy_info[3]
                udpxy = "http://" + ip + ":" + port
                actv = udpxy_info[4]
                
                index = 0
                error_cnt = 0
                speed = 0.00
                sum_speed = 0.00
                # 打开包含数据的文件
                with open(file_path, 'r') as file:
                    data_list = []
                    number = 0
                    for i, line in enumerate(file):
                        # 获取当前时间
                        current_time = datetime.now()
                        line = line.strip()
                        if ',' not in line or 'CAVS' in line or '测试' in line:
                            print(f"{current_time} 第 {i} 行数据，不包含逗号或无效频道，跳过处理")
                            continue
        
                        # 提取两列数据
                        source_data = line.split(',')
                        m3u8_name = source_data[0]
                        m3u8_name = m3u8_name[:m3u8_name.index('[')] if '[' in m3u8_name else m3u8_name
                        m3u8_name = m3u8_name.replace("HD", "").replace("标清", "").replace("超高清", "4K").replace("高清", "").replace("超清", "")
                        m3u8_name = m3u8_name.replace("#EXTINF-1", "")
                        m3u8_links = source_data[1]
                        # print(f"index：{index}，频道 {m3u8_name}，地址 [{m3u8_links}]")
                        
                        m3u8_values = m3u8_links.split('#')
                        if m3u8_links != "" and len(m3u8_values) > 0:
                            # 循环处理每个#分割结果
                            for m3u8_link in m3u8_values:
                                # 去掉$之后的字符
                                if "$" in m3u8_link:
                                    m3u8_link = m3u8_link.split("$")[0]
                                m3u8_link = T.get_multicast_addr(m3u8_link)
                                if m3u8_link is None:
                                    continue
                                index += 1
                                if index > 3 and error_cnt >= 3:
                                    break
                                m3u8_link = udpxy + "/rtp/" + m3u8_link
                                
                                # 匹配频道类型
                                category = T.get_category(m3u8_name, category_list)
                                # 获取频道分类
                                category_type = category[1]
                                if category_type is not None:
                                    # 获取频道名称
                                    m3u8_name = category[0]
                                if T.valid_url(m3u8_link, 15):
                                    data_info = (m3u8_name, m3u8_link)
                                    speed = 0.00
                                    if index <= 3:
                                        speed = T.get_ffmpeg_speed(m3u8_link)
                                        speed = 0.00 if speed < 5.00 else speed
                                        if speed == 0.00:
                                            error_cnt += 1
                                            print(f"{current_time} 第{index}条数据地址播放无效，频道名称：{m3u8_name}，频道类型: {category_type}，无效地址: {m3u8_link}")
                                        else:
                                            sum_speed += speed
                                    else:
                                        speed = round(sum_speed/(3 - error_cnt), 2)
                                    
                                    if not any(info[:2] == data_info[:2] for info in data_list):
                                        # 将数据添加到列表
                                        data_list.append((m3u8_name, m3u8_link, category_type, speed, sign))
                                        print(f"{current_time} 第{index}条数据有效，频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}，播放速度: {speed} Mbps")
                                        number += 1
                                    else: 
                                        # print(f"{current_time} 第{index}条数据频道信息重复，频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}")
                                        continue
                                else: 
                                    if index <= 3:
                                        error_cnt += 1
                                        print(f"{current_time} 第{index}条数据频道地址无效，频道名称：{m3u8_name}，频道类型: {category_type}，无效地址: {m3u8_link}")
                                    continue
                    if error_cnt < 3 and udpxy not in str_udpxy:
                        lines += 1
                        str_city += ',' + city
                        str_udpxy += ',' + udpxy
                        # 去掉开头的逗号
                        str_city = str_city[1:] if str_city.startswith(',') else str_city
                        str_udpxy = str_udpxy[1:] if str_udpxy.startswith(',') else str_udpxy
                        print(f"{current_time} 有效组播代理udpxy：{str_udpxy}")
                        # 插入频道至数据库
                        process_channels(data_list)
                    else:
                        print(f"{current_time} 无效组播代理udpxy：{udpxy}")
            
            # udpxy代理状态
            status = 1 if lines >= 1 else 0
            # 将数据添加到更新列表
            multicast_update_list.append((str_city, str_udpxy, lines, status, current_time, mid))
            
            # 更新组播信息至数据库
            process_multicast(multicast_update_list)
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def main_function():
    # 获取当前时间
    current_time = datetime.now()
    # 判断当前日期的星期几（星期一：0，星期二：1，...，星期日：6）
    weekday = current_time.weekday() + 1
    hour = current_time.hour
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        print(f"{current_time} 当前时间：{hour} 时执行组播处理")
        
        # 组播代理更新
        multicast_udpxy()
        
        # 组播频道解析
        multicast_channel()
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

# 执行主程序函数
main_function()
