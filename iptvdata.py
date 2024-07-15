import mysql.connector
import re
import os
import cv2
import time
import m3u8
import requests
import numpy as np
import tools
from queue import Queue
from datetime import datetime, timedelta
from timeout_decorator import timeout, TimeoutError
from concurrent.futures import ThreadPoolExecutor, as_completed

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
        insert_sql = "INSERT INTO iptv_channels (name, url, type, width, height, frame, speed, sign) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
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

def process_channels_speeds(data_queue, thread_id):
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    print(f"{current_time} 第{thread_id + 1}个队列开始处理数据，队列中数据量：{data_queue.qsize()}")
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        # 更新频道信息的 SQL 语句
        update_hotel = "UPDATE iptv_channels SET speed = %s, width = %s, height = %s, frame = %s WHERE id = %s;"
        update_list = []
        # 用于计数
        count = 0
        
        # 遍历查询结果
        while not data_queue.empty():
            # 获取后将数据从队列中移除
            channel = data_queue.get()
            # 获取当前时间
            current_time = datetime.now()
            
            id = channel[0]
            name = channel[1]
            url = channel[2]
            sign = channel[3]
            speed = channel[4]
            
            # 检测获取视频信息
            video_info = T.get_ffprobe_info(url)
            if len(video_info) == 0:
                continue
            
            # 提取宽度和高度
            width = video_info[0]
            height = video_info[1]
            # 提取帧速率
            frame = video_info[2]
            
            if speed == 0.00:
                speed = T.get_ffmpeg_speed(url)
                print(f"{current_time} 无效：频道名称{id}：{name}，播放速度：{speed} Mbps，分辨率：{width}*{height}，帧速率：{frame}, 无效地址: {url}")
                # 删除频道信息
                # delete_hotel = "DELETE from iptv_channels WHERE id = %s;"
                # cursor.execute(delete_hotel, (id,))
                # continue
            else:
                print(f"{current_time} 有效：频道名称{id}：{name}，播放速度：{speed} Mbps，分辨率：{width}*{height}，帧速率：{frame}, 有效地址: {url}")
            
            # 将数据添加到列表
            update_list.append(((speed, width, height, frame, id)))
            # 每添加一条数据，计数器加一
            count += 1
            
            # 当累积到300条数据时执行批量提交
            print(f"{current_time} 第{thread_id + 1}个队列，当前累计待提交数量：{count} 个")
            if count == 300:
                # 执行批量更新
                cursor.executemany(update_hotel, update_list)
                # 提交数据库事务
                cnx.commit()
                print(f"{current_time} 共 {len(update_list)} 行数据, 批量速度修改提交成功")
                # 重置计数器和更新列表
                count = 0
                update_list = []
        
        if len(update_list) > 0:
            # 执行批量更新
            cursor.executemany(update_hotel, update_list)
            # 提交数据库事务
            cnx.commit()
            update_list = []
            print(f"{current_time} 共 {len(update_list)} 行数据, 批量速度修改提交成功")
        
        # 标记任务完成
        data_queue.task_done()
        
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def sweep_speeds():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()

        # 查询频道信息
        query_channels = "SELECT c.id, c.name, c.url, c.sign, c.speed FROM iptv_channels c WHERE c.sign > 0 and c.width is NULL ORDER BY c.id;"
        cursor.execute(query_channels)
        channels = cursor.fetchall()
        print(f"{current_time} 总数据{len(channels)}")
        
        # 多线程处理数量
        queues_count = 5
        # 创建线程队列
        data_queues = [Queue() for _ in range(queues_count)]
        for i, channel in enumerate(channels):
            # 根据索引将数据放入不同的队列
            data_queues[i % queues_count].put(channel)
        
        # 创建线程池
        with ThreadPoolExecutor(max_workers = queues_count) as executor:
            # 启动线程池
            for i in range(queues_count):
                executor.submit(process_channels_speeds, data_queues[i], i)
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def internet_lives():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    sign = 0
    # https://live.metshop.top/huyayqk.m3u?url=https://live.metshop.top
    file_url = 'http://lives.taoiptv.com/yylunbo.m3u?url=http://lives.taoiptv.com'
    file_path = 'source/download/yylunbo.m3u'
    
    try:
        # 下载文件
        # encoded_url = urllib.parse.quote(file_source, safe=':/')
        response = requests.get(file_url, headers={'User-Agent': 'Mozilla/5.0'}, timeout=30)
        with open(file_path, 'wb') as file:
            file.write(response.content)
        #urllib.request.urlretrieve(req, base_source + 'temp.m3u')
        print(f"{current_time} 文件地址：{file_path}，下载成功！")
        
        # 获取文件大小（以字节为单位）
        file_size = os.path.getsize(file_path)
        # 文件大于3KB
        if file_size < 3 * 1024:
            print(f"{current_time} 文件大小不满足条件，{file_path}可能是空内容，不处理直播资源！")
            return
        
        if file_path.endswith('.m3u'):
            file_path = T.convertToTxt(file_path)
    except Exception as e:
        print(f"{current_time} 文件地址：{file_path}，下载失败:", str(e))
    
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        query_name = "SELECT psw, name, type FROM iptv_category WHERE enable = 1 ORDER BY id DESC;"
        cursor.execute(query_name)
        # 获取所有结果
        category_list = cursor.fetchall()
        
        # 删除频道信息
        delete_channel = "DELETE from iptv_channels WHERE sign = %s;"
        cursor.execute(delete_channel, (sign,))
        cnx.commit()
        
        # 打开包含数据的文件
        with open(file_path, 'r') as file:
            number = 0
            # 信任频道
            sign = 0
            # 播放速度
            speed = 5.00
            # 宽度和高度
            width = 1280
            height = 720
            # 帧速率
            frame = 25
            # 初始化集合数据
            data_list = []
            trans_count = 0
            for line in file:
                # 获取当前时间
                current_time = datetime.now()
                line = line.strip()
                if ',' not in line or 'http' not in line:
                    # print(f"{current_time} 第 {line_count} 行数据，不包含逗号或字符串'http'，跳过处理")
                    continue

                # 提取两列数据
                source_data = line.split(',')
                m3u8_name = source_data[0]
                m3u8_name = m3u8_name.strip()
                m3u8_name = m3u8_name.replace("#EXTINF-1", "")
                m3u8_link = source_data[1]
                # print(f"频道 {m3u8_name}，地址 [{m3u8_link}]")
                # 匹配频道类型
                category = T.get_category(m3u8_name, category_list)
                # 获取频道分类
                category_type = category[1]
                if category_type is None:
                    # print(f"{current_time} 频道类型匹配失败：频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}")
                    continue
                
                if T.valid_url(m3u8_link, 15):
                    # 获取频道名称
                    m3u8_name = category[0]
                    data_info = (m3u8_name, m3u8_link)
                    if not any(info[:2] == data_info[:2] for info in data_list):
                        # 将数据添加到列表
                        channel_info = (m3u8_name, m3u8_link, category_type, width, height, frame, speed, sign)
                        data_list.append(channel_info)
                        print(f"{current_time} 第{number+1}条数据，频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}")
                        '''
                        if 'http://lives.taoiptv.com' in m3u8_link:
                            m3u8_link = m3u8_link.replace("http://lives.taoiptv.com", "https://live.metshop.top")
                            # 将数据添加到列表(备份线路)
                            channel_info = (m3u8_name, m3u8_link, category_type, width, height, frame, speed, sign)
                            data_list.append(channel_info)
                            print(f"{current_time} 第{number+1}条数据，频道名称：{m3u8_name}，备份线路添加成功，频道地址: {m3u8_link}")
                        '''
                        number += 1
                        trans_count += 1
                    else: 
                        # print(f"{current_time} 频道信息筛选重复：频道名称：{m3u8_name}，频道类型: {category_type}，频道地址: {m3u8_link}")
                        continue
                else:
                    # print(f"{current_time} 频道地址校验失败：频道名称：{m3u8_name}，频道类型: {category_type}，无效地址: {m3u8_link}")
                    continue
                
                if trans_count == 100:
                    # 插入频道至数据库
                    process_channels(data_list)
                    trans_count = 0
                    data_list = []
            if len(data_list) > 0:
                # 插入频道至数据库
                process_channels(data_list)
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def creat_iptvs():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    # 基础资源目录
    base_source = "source/"
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        # 查询频道分类
        query_category = "SELECT type FROM iptv_category WHERE enable = 1 GROUP BY type ORDER BY id;"
        cursor.execute(query_category)
        categories = cursor.fetchall()

        # 循环查询频道分类的名称和URL
        result_pub = ""

        for category in categories:
            category_type = category[0]
            query_name = "SELECT id, name, type FROM iptv_category WHERE enable = 1 and type = %s ORDER BY id;"
            cursor.execute(query_name, (category_type,))
            # 获取所有结果
            category_info = cursor.fetchall()
                
            # 更新频道信息的 SQL 语句
            update_channel = "UPDATE iptv_channels SET time = %s WHERE id = %s;"
            
            # 生成分类数据行
            result_pub += f"{category_type},#genre#\n"
            
            for info in category_info:
                # 集合用于存储已处理的频道记录
                processed_channels = set()
                update_list = []
                # 获取当前时间
                current_time = datetime.now()
                type_id = info[0]
                chl_name = info[1]
                chl_type = info[2]
                
                query_name_url = "SELECT v.name, v.url, v.id, v.type, v.width, v.speed FROM (SELECT c.name, c.url, c.id, c.type, c.width, c.speed, c.sign, c.time from iptv_channels c "
                query_name_url += "WHERE c.sign >= 0 and c.speed > 0) as v INNER JOIN iptv_category t ON v.name = t.name where ((v.type in ('央视频道', '卫视频道') "
                query_name_url += "and v.width >= 1280) or (v.type not in ('央视频道', '卫视频道') and v.width >= 1280)) and t.name = %s ORDER BY RAND();"
                # ORDER BY v.width DESC, v.speed DESC
                cursor.execute(query_name_url, (chl_name,))
                channels = cursor.fetchall()
                
                number = 0
                for i, channel in enumerate(channels):
                    name = channel[0]
                    url = channel[1]
                    chl_id = channel[2]
                    width = channel[4]
                    
                    # 将更新标识添加到列表
                    update_list.append((current_time, chl_id))
                    # 检查是否已处理过该频道记录
                    if (name, url) not in processed_channels:
                        # 将已处理的频道记录添加到集合中
                        processed_channels.add((name, url))
                        result_pub += f"{name},{url}\n"
                        number += 1
                    else:
                        # print(f"{current_time} 频道地址重复或无效：{name},{url}")
                        continue
                
                print(f"{current_time} 频道名称{chl_id}：{chl_name}，有效源数量：{number}")
                
                if len(update_list) > 0:
                    # 执行批量更新
                    cursor.executemany(update_channel, update_list)
                    # 提交数据库事务
                    cnx.commit()
                    print(f"{current_time} 共 {len(update_list)} 行数据, 批量频道时间修改提交成功")

        # 循环查询频道分类的名称和URL
        update_time = current_time.strftime("%Y-%m-%d %H:%M:%S")
        result_pub += f"更新时间,#genre#\n{update_time},https://taoiptv.com/time.mp4\n"

        # 将结果写入文件
        output_file = base_source + 'iptv.txt'
        
        # txt格式写入
        with open(output_file, 'w') as f:
            f.write(result_pub)
        print(f"IPTV数据文件已生成：{output_file}")
        
        # 调用函数进行转换
        T.convertToM3u(output_file)
        
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

def main_function():
    # 获取当前时间
    current_time = datetime.now()
    hour = current_time.hour
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        # 扫描播放速度
        sweep_speeds()
        # 直播资源处理
        internet_lives()
        # 生成IPTV资源
        creat_iptvs()
        
    except mysql.connector.Error as e:
        print(f"{current_time} 执行数据库操作时, 发生异常: {str(e)}")
    finally:
        # 关闭游标和连接
        cursor.close()
        cnx.close()

# 执行主程序函数
main_function()