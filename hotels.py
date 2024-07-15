import os
import re
import requests
import socket
import multiprocessing
import m3u8
import time
import json
import subprocess
import tools
import urllib.parse
import mysql.connector
from queue import Queue
from datetime import datetime, timedelta
from bs4 import BeautifulSoup
from urllib.parse import urlparse, parse_qs
from mysql.connector import pooling
from requests.exceptions import RequestException
from concurrent.futures import ThreadPoolExecutor, as_completed

# 获取工具类
T = tools.Tools()

# 创建连接池
connection_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="iptv_pool",
    pool_size=10,
    host='192.168.199.119',
    user='iptv',
    password='iptv',
    database='iptv'
)

def process_hotels(data_list):
    # 获取当前时间
    current_time = datetime.now()
    line_count = len(data_list)
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()

        # 如果数据库中存在相同的URL，若无则插入数据到数据库
        insert_sql = "INSERT INTO iptv_hotels (ip, port, name, count, status, time) VALUES (%s, %s, %s, %s, %s, %s)"
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

def hotel_channels(ip, port):
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    
    ip_port = ip + ":" + port
    # print(f"{current_time} 检查直播源：{ip_port}")
    
    # 从连接池获取连接
    cnx = connection_pool.get_connection()
    # 创建游标对象
    cursor = cnx.cursor()
    
    data_list = []

    # 生成数据格式
    url = "http://" + ip_port + "/iptv/live/1000.json?key=txiptv"

    # 发起HTTP请求获取网页内容
    try:
        response = requests.get(url, timeout=15)
        # 检查响应状态码
        if response.status_code == 200:
            # 解析JSON数据
            json_data = response.json()
        
            # 获取count的值
            count = json_data['count']
        
            # 获取data中的name和url的值
            for item in json_data['data']:
                name = item['name']
                m3u8_link = item['url']
                if ".m3u8" not in m3u8_link or "http" in m3u8_link:
                    continue
                # 解析地址
                m3u8_link = "http://" + ip_port + item['url']
                data_info = (name, m3u8_link)
                if not any(info[:2] == data_info[:2] for info in data_list):
                    # 将数据添加到列表
                    data_list.append(data_info)
        return data_list
    except (requests.Timeout, requests.RequestException, KeyError) as e:
        print(f"{current_time} 请求超时或异常：{url}")
        return []
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

# 定义扫描函数
def process_scan_ip(data_queue, thread_id):
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    print(f"{current_time} 第{thread_id + 1}个队列开始处理数据，队列中数据量：{data_queue.qsize()}")
    # 有效列表
    hotel_list = []
    # 遍历查询结果
    while not data_queue.empty():
        # 获取后将数据从队列中移除
        data = data_queue.get()
        # 获取当前时间
        current_time = datetime.now()
        # 获取ip和端口
        ip = data[0]
        port = data[1]
        result = None
        try:
            # 创建一个套接字对象
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.settimeout(2)  # 设置超时时间为 2 秒
            # 尝试连接
            result = s.connect_ex((ip, port))
            # 关闭套接字
            s.close()
        except socket.error as e:
            print(f"扫描IP地址：{ip}:{port} 连接错误: {e}")
        
        # 如果连接成功，则打印扫描成功的信息
        if result == 0:
            try:
                # 从连接池获取连接
                cnx = connection_pool.get_connection()
                # 创建游标对象
                cursor = cnx.cursor()
                
                # 获取扫描IP地址段
                last_dot = ip.rfind('.')
                base_ip = ip[:last_dot]
                
                # 检测是否有效
                ip_port = ip + ":" + str(port)
                test_url = "http://" + ip_port + "/tsfile/live/0003_1.m3u8?key=txiptv"
                speed = T.get_ffmpeg_speed(test_url)
                test_url = "http://" + ip_port + "/tsfile/live/0006_1.m3u8?key=txiptv"
                speed = speed + T.get_ffmpeg_speed(test_url)
                print(f"扫描IP地址：{ip}:{port} 可连接, 播放速度：{speed} Mbps")
                
                # 检查酒店IP是否存在
                check_sql = "SELECT count(*) FROM iptv_hotels WHERE ip like %s"
                cursor.execute(check_sql, (base_ip + '%',))
                # 获取查询结果
                is_exist = cursor.fetchone()[0] > 0
                if not is_exist and speed > 0:
                    # 初始化集合数据
                    data_list = [(ip, port, '扫描检查更新酒店源', 1, 1, current_time)]
                    # 插入酒店源至数据库
                    process_hotels(data_list)
                    print(f"{current_time} 更新，有效IP地址：{ip}:{port}")
                else:
                    print(f"{current_time} 弃用，无效IP地址：{ip}:{port}")
            except mysql.connector.Error as e:
                print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
            finally:
                # 关闭游标和连接
                cursor.close()
                cnx.close()

def gyssi_hotels():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        # 超时次数
        timeout_cnt = 0
        # 基础资源目录
        base_source = "source/hotels/"
        # 定义下载m3u地址省份
        province_names = ["上海市", "云南省", "内蒙古自治区", "北京市", "吉林省", "四川省", "安徽省", "山东省", "山西省", "广东省", "广西壮族自治区", "江苏省", "江西省", "河北省", "河南省", "浙江省", "海南省", "湖北省", "湖南省", "福建省", "辽宁省", "重庆市", "陕西省", "黑龙江省"]
        # M3U基础页面的 URL https://gyssi.link/login.html
        token_url = 'https://gyssi.link/iptv/jwt.html'
        base_url = 'https://gyssi.link/iptv/chinaiptv/'
        
        token_response = T.request_body(token_url)
        # 检查请求是否成功
        token_content = token_response.text
        # 使用BeautifulSoup解析网页内容
        token_soup = BeautifulSoup(token_content, "html.parser")
        # 查找所有class为"result"的<div>标签
        # 获取 id 为 "token" 的元素的值
        token = token_soup.find(id="token").text
        
        number = 0
        # 初始化酒店集合
        hotel_list = []
        for m3u_name in province_names:
            m3u_url = base_url + m3u_name + ".m3u"
            base_file = base_source + m3u_name + '.m3u'
            try: 
                # 数据行集合
                merged_lines = []
                m3u_url = urllib.parse.quote(m3u_url, safe=':/') + "?token=" + token
                
                # 下载文件
                response = requests.get(m3u_url, timeout=15, headers={'User-Agent': 'Mozilla/5.0'})
                with open(base_file, 'wb') as file:
                    file.write(response.content)
                print(f"{current_time} m3u_url：{m3u_url}")
                
                # 获取文件大小（以字节为单位）
                file_size = os.path.getsize(base_file)
                # 文件小于1KB无效
                if file_size < 1 * 1024:
                    print(f"{current_time} M3U省份文件：{base_file}，下载无效")
                    continue
                
                base_file = T.convertToTxt(base_file)
                
                # 读取文件内容
                with open(base_file, 'r') as file:
                    for line in file:
                        # 获取当前时间
                        current_time = datetime.now()
                        line = line.strip()
                        # 正则匹配
                        match = re.search(r'http://(.*?)\/tsfile\/live', line)
                        if not match:
                            # print(f"{current_time} 第 {line_count} 行数据，不包含逗号或字符串'http'，跳过处理")
                            continue
                        line = match.group(1)
                        # 提取两列数据
                        ip_port = line.split(':')
                        ip = ip_port[0]
                        port = ip_port[1]
                        # 校验酒店源信息
                        channel_list = hotel_channels(ip, port)
                        count = len(channel_list)
                        if count > 3:
                            base_ip = ip[:ip.rfind('.')]
                            # 检查酒店IP是否存在
                            check_sql = "SELECT count(*) FROM iptv_hotels WHERE ip like %s"
                            cursor.execute(check_sql, (base_ip + '%',))
                            # 获取查询结果
                            is_exist = cursor.fetchone()[0] > 0
                            hotel_info = (ip, port, '初始采集酒店源', count, 0, current_time)
                            if not is_exist and not any(info[:1] == hotel_info[:1] for info in hotel_list):
                                # 将数据添加到列表
                                hotel_list.append(hotel_info)
                                print(f"{current_time} 新增第{number+1}条数据，酒店IP&端口：{ip}:{port}，频道数量：{count}")
                                number += 1
                        break
            except (requests.Timeout, requests.RequestException) as e:
                timeout_cnt += 1
                print(f"{current_time} 请求发生超时，异常次数：{timeout_cnt}")
                if timeout_cnt <= 2:
                    # 继续下一次循环迭代
                    continue
        
        # 插入酒店源至数据库
        process_hotels(hotel_list)
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

search_urls = [
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0iSGViZWki",  # Hebei 河北
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0iYmVpamluZyI%3D",  # Beijing 北京
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0iZ3Vhbmdkb25nIg%3D%3D",  # Guangdong 广东
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0ic2hhbmdoYWki",  # Shanghai 上海
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0idGlhbmppbiI%3D",  # Tianjin 天津
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0iY2hvbmdxaW5nIg%3D%3D",  # Chongqing 重庆
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0ic2hhbnhpIg%3D%3D",  # Shanxi 山西
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0iU2hhYW54aSI%3D",  # Shaanxi 陕西
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0ibGlhb25pbmci",  # Liaoning 辽宁
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0iamlhbmdzdSI%3D",  # Jiangsu 江苏
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0iemhlamlhbmci",  # Zhejiang 浙江
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5a6J5b69Ig%3D%3D",  # Anhui 安徽
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0iRnVqaWFuIg%3D%3D",  # Fujian 福建
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5rGf6KW%2FIg%3D%3D",  # Jiangxi江西
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5bGx5LicIg%3D%3D",  # Shandong山东
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5rKz5Y2XIg%3D%3D",  # Henan 河南
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5rmW5YyXIg%3D%3D",  # Hubei 湖北
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5rmW5Y2XIg%3D%3D",  # Hunan 湖南
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5ZCJ5p6XIg%3D%3D",  # Jilin 吉林
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5YaF6JKZ5Y%2BkIg%3D%3D",  # Nei Mongol 内蒙古
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i6buR6b6Z5rGfIg%3D%3D",  # Heilongjiang 黑龙江
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5bm%2F6KW%2FIg%3D%3D",  # Guangxi 广西
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5rW35Y2XIg%3D%3D",  # Hainan 海南
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5Zub5bedIg%3D%3D",  # Sichuan 四川
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i6LS15beeIg%3D%3D",  # Guizhou 贵州
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i5LqR5Y2XIg%3D%3D",  # Yunnan 云南
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj3nlJjogoM%3D",  # Gansu 甘肃
    "https://fofa.info/result?qbase64=ImlwdHYvbGl2ZS96aF9jbi5qcyIgJiYgY291bnRyeT0iQ04iICYmIHJlZ2lvbj0i6aaZ5rivIg%3D%3D",  # HK 香港
    ]

def internet_hotels():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    # 网络源标记
    sign = 1
    
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        number = 0
        # 初始化酒店集合
        hotel_list = []
        for search_url in search_urls:
            status_response = T.request_body(search_url)
            if status_response is None:
                continue
            # 处理响应
            status_response.raise_for_status()
            # 检查请求是否成功
            html_content = status_response.text
            # 使用BeautifulSoup解析网页内容
            html_soup = BeautifulSoup(html_content, "html.parser")
            # print(f"{current_time} html_content:{html_content}")
            # 查找所有符合指定格式的网址
            # 设置匹配的格式，如http://8.8.8.8:8888
            pattern = r"http://\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d+"
            urls_all = re.findall(pattern, html_content)
            # 去重得到唯一的URL列表
            result_urls = set(urls_all)
            # print(f"{current_time} result_urls:{result_urls}")
            for url in result_urls:
                parsed_url = urlparse(url)
                # print(f"IP: {parsed_url.hostname}, Port: {parsed_url.port}")
                ip = parsed_url.hostname
                port = str(parsed_url.port)
                base_ip = ip[:ip.rfind('.')]
                # 检查酒店IP是否存在
                check_sql = "SELECT count(*) FROM iptv_hotels WHERE ip like %s"
                cursor.execute(check_sql, (base_ip + '%',))
                # 获取查询结果
                is_exist = cursor.fetchone()[0] > 0
                if is_exist:
                    continue
                # 校验酒店源信息
                channel_list = hotel_channels(ip, port)
                count = len(channel_list)
                if count <= 3:
                    continue
                hotel_info = (ip, port, '初始采集酒店源', count, 0, current_time)
                if not any(info[:1] == hotel_info[:1] for info in hotel_list):
                    # 将数据添加到列表
                    hotel_list.append(hotel_info)
                    print(f"{current_time} 新增第{number+1}条数据，酒店IP&端口：{ip}:{port}，频道数量：{count}")
                    number += 1
        # 插入酒店源至数据库
        process_hotels(hotel_list)
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def spider_sources():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    # 网络源标记
    sign = 1
    engine_url = "http://tonkiang.us/"
    
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        # 查询频道类型
        query_name = "SELECT psw, name, type FROM iptv_category WHERE enable = 1 ORDER BY id DESC;"
        cursor.execute(query_name)
        # 获取所有结果
        category_list = cursor.fetchall()
    
        # 爬取直播源引擎
        groups = ["cfss.cc", "smtcdns.net"]
        for group_addr in groups:
            # 获取当前时间
            current_time = datetime.now()
        
            page = 1
            number = 0
            page_count = 1
            counts = 1
            timeout_cnt = 0
            # 初始化集合数据
            data_list = []

            # 生成数据格式
            while page <= page_count and number < counts:
                url = engine_url + "?page=" + str(page) + "&s=" + group_addr
                # 发起HTTP请求获取网页内容
                try:
                    response = requests.get(url, timeout=15)
                    # 处理响应
                    response.raise_for_status()
                    # 检查请求是否成功
                    html_content = response.text
                    
                    print(f"{current_time} 处理组播直播源：{url}")

                    # 使用BeautifulSoup解析网页内容
                    soup = BeautifulSoup(html_content, "html.parser")

                    # 查找所有class为"result"的<div>标签
                    result_divs = soup.find_all("div", class_="result")

                    # 循环处理每个结果<div>标签
                    for result_div in result_divs:
                        # 获取m3u8名称
                        m3u8_name = None
                        channel_div = result_div.find("div", class_="channel")
                        if channel_div is not None:
                            name_div = channel_div.find("div", style="float: left;")
                            if name_div is not None:
                                m3u8_name = name_div.text.strip()
                            else: 
                                counts_text = channel_div.text.strip()
                                # 提取数字部分
                                counts = int(''.join(filter(str.isdigit, counts_text)))
                                # print(f"{current_time} 总记录数：{counts}")
                                page_count = int(counts) // 30
                                if counts/30 > page_count:
                                    page_count += 1
                                #print(f"{current_time} 总页码数：{page_count}")
                        else:
                            continue

                        # 获取m3u8链接
                        m3u8_link = None
                        m3u8_div = result_div.find("div", class_="m3u8")
                        if m3u8_div is not None:
                            m3u8_link = m3u8_div.find("td", style="padding-left: 6px;").text.strip()
                            if m3u8_link.endswith('?'):
                                m3u8_link = m3u8_link[:-1]
                            
                            # 匹配频道类型
                            category = T.get_category(m3u8_name, category_list)
                            # 获取频道分类
                            category_type = category[1]
                            if category_type is None:
                                print(f"{current_time} 频道类型匹配失败：频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}")
                                continue
                            if T.check_url(m3u8_link):
                                # 获取频道名称
                                m3u8_name = category[0]
                                data_info = (m3u8_name, m3u8_link)
                                if not any(info[:2] == data_info[:2] for info in data_list):
                                    # 将数据添加到列表
                                    data_list.append((m3u8_name, m3u8_link, category_type, 0.00, sign))
                                    # print(f"{current_time} 第{number+1}条数据，频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}")
                                    number += 1
                                else: 
                                    print(f"{current_time} 频道信息筛选重复：频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}")
                                    continue
                            else: 
                                print(f"{current_time} 频道地址校验失败：频道名称：{m3u8_name}，频道类型: {category_type}，无效地址: {m3u8_link}")
                                continue
                        else:
                            continue
                except (requests.Timeout, requests.RequestException) as e:
                    timeout_cnt += 1
                    print(f"{current_time} 请求发生超时，异常次数：{timeout_cnt}")
                    if timeout_cnt <= 5:
                        # 继续下一次循环迭代
                        continue
                
                page += 1
            # 插入频道至数据库
            process_channels(data_list)
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def sweep_hotels():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()

        # 查询酒店源信息
        query_hotels = "SELECT ip, port, status FROM iptv_hotels WHERE (status = 0 or count = 0) and name not like '%华视美达';"
        cursor.execute(query_hotels)
        hotels = cursor.fetchall()

        # 循环检查酒店源信息
        for hotel in hotels:
            # 获取当前时间
            current_time = datetime.now()
            # 多线程处理数量
            queues_count = 6
            # 创建线程队列
            data_queues = [Queue() for _ in range(queues_count)]
            
            old_ip = hotel[0]
            port = int(hotel[1])
            # 获取扫描IP地址段
            last_dot = old_ip.rfind('.')
            if T.check_ip(old_ip) and last_dot != -1:
                base_ip = old_ip[:last_dot + 1]
                # 清空酒店直播源信息
                delete_hotel = "DELETE from iptv_hotels WHERE (status = 0 or count = 0) and ip like %s;"
                cursor.execute(delete_hotel, (base_ip + '%',))
                cnx.commit()
                print(f"{current_time} 扫描IP地址段：{base_ip}")
                
                base_ip = old_ip[:last_dot + 1]
                ips = [base_ip + str(i) for i in range(1, 256)]
                ip_port_list = [(ip, port) for ip in ips]
                
                for i, ip_port in enumerate(ip_port_list):
                    # 根据索引将数据放入不同的队列
                    data_queues[i % queues_count].put(ip_port)
                
                # 创建线程池
                with ThreadPoolExecutor(max_workers = queues_count) as executor:
                    # 启动线程池
                    for i in range(queues_count):
                        executor.submit(process_scan_ip, data_queues[i], i)
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def parse_hotels():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    # 酒店源标记
    sign = 1
    
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        query_name = "SELECT psw, name, type FROM iptv_category WHERE enable = 1 ORDER BY id DESC;"
        cursor.execute(query_name)
        # 获取所有结果
        category_list = cursor.fetchall()
        
        # 查询酒店源信息
        query_hotels = "SELECT ip, port, name, count, status, time FROM iptv_hotels WHERE status in (1, 1) and name not like '%华视美达%' ORDER BY count DESC;"
        cursor.execute(query_hotels)
        hotels = cursor.fetchall()
        # 循环检查酒店源信息
        for hotel in hotels:
            try:
                # 获取当前时间
                current_time = datetime.now()
                ip = hotel[0]
                port = hotel[1]
                ip_port = ip + ":" + port
                
                # 获取扫描IP地址段
                last_dot = ip.rfind('.')
                base_ip = ip[:last_dot]
                if base_ip is None or base_ip == "":
                    continue
                
                number = 0
                data_list = []
                source_name = "无效IP和端口"
                index = 0
                error_cnt = 0
                status = 0
                speed = 0.00
                sum_speed = 0.00
                
                # 查询酒店源数量
                query_sql = f"SELECT count(*) FROM iptv_channels WHERE url like %s and sign = {sign};"
                cursor.execute(query_sql, ('%' + base_ip + '%',))
                # 获取查询结果
                valid_count = cursor.fetchone()[0]
                
                # 校验酒店源信息
                channel_list = hotel_channels(ip, port)
                # 循环处理每个结果<br>标签
                for channel_info in channel_list:
                    index += 1
                    if index > 3 and error_cnt >= 3:
                        break
                    m3u8_name = channel_info[0]
                    m3u8_name = m3u8_name[:m3u8_name.index('[')] if '[' in m3u8_name else m3u8_name
                    m3u8_name = m3u8_name.replace("HD", "").replace("标清", "").replace("超高清", "4K").replace("高清", "").replace("超清", "")
                    m3u8_link = channel_info[1]
                    # 替换&playlive=1&authid=0
                    m3u8_link = m3u8_link.replace("&playlive=0&authid=0", "");
                    m3u8_link = m3u8_link.replace("&playlive=1&authid=0", "");
                    m3u8_link = m3u8_link.replace("&playlive=1&down=1", "");
                    # 匹配频道类型
                    category = T.get_category(m3u8_name, category_list)
                    # 获取频道分类
                    category_type = category[1]
                    if category_type is not None:
                        # 获取频道名称
                        m3u8_name = category[0]
                    if T.check_url(m3u8_link):
                        data_info = (m3u8_name, m3u8_link)
                        if index <= 3:
                            speed = T.get_ffmpeg_speed(m3u8_link)
                            speed = 0.00 if speed < 2.00 else speed
                            if speed == 0.00:
                                error_cnt += 1
                                # print(f"{current_time} 第{index}条数据地址播放无效，频道名称：{m3u8_name}，频道类型: {category_type}，无效地址: {m3u8_link}")
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
                # 检查酒店源有效
                if error_cnt < 3:
                    # 酒店源状态
                    status = 1
                    source_name = T.get_ip_guishu(ip)
                    print(f"{current_time} 酒店IPTV源：{ip_port}，地区名称：{source_name}，状态：{status}")
                    # 存在频道表
                    if valid_count > 0:
                        print(f"{current_time} 酒店IPTV源：{ip_port}，待修改频道播放速度{speed}")
                    else:
                        # 插入频道至数据库
                        process_channels(data_list)
                else:
                    # 酒店源状态
                    status = 0
                    # 存在频道表
                    if valid_count > 0:
                        # 删除频道信息
                        delete_channel = f"DELETE from iptv_channels WHERE url like %s and sign = {sign};"
                        cursor.execute(delete_channel, ('%' + base_ip + '%',))
                        cnx.commit()
                        print(f"{current_time} 酒店IPTV源：{ip_port}，无效频道已删除")
                
                # 更新酒店直播源信息
                update_hotel = "UPDATE iptv_hotels SET name = %s, count = %s, status = %s, `time` = %s WHERE ip = %s;"
                number = 0 if status == 0 else (number if valid_count == 0 else valid_count)
                cursor.execute(update_hotel, (source_name, number, status, current_time, ip))
                cnx.commit()
            except (json.JSONDecodeError, requests.RequestException) as e:
                print(f"{current_time} 酒店源解析处理异常，酒店信息：{hotel}")
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def main_function():
    # 获取当前时间
    current_time = datetime.now()
    # 判断当前日期的星期几（星期：1-7）
    weekday = current_time.weekday() + 1
    hour = current_time.hour
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        # 1/ 爬取酒店资源
        # internet_hotels()
        if weekday%2 == 1:
            print(f"{current_time} 当前时间：周{weekday}，执行资源下载")
            gyssi_hotels()
        
        # 2/扫描酒店资源
        sweep_hotels()
        
        # 3/解析酒店资源
        parse_hotels()
        
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

# 执行主程序函数
main_function()