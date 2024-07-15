#!/usr/bin/env python
# -*- coding: utf-8 -*-
import urllib.request
import urllib.parse
import urllib.error
import re
import ssl
import io
import os
import signal
import time
import gzip
import random
import socket

import m3u8
import json
import requests
import subprocess
import mysql.connector
from ftplib import FTP, error_perm, error_temp
from datetime import datetime
from bs4 import BeautifulSoup
from urllib.parse import urlparse
from concurrent.futures import ThreadPoolExecutor
from mysql.connector import pooling
from requests.exceptions import RequestException
socket.setdefaulttimeout(5.0)

class Tools (object) :

    def __init__ (self) :
        pass
    
    # 校验是否为ip地址
    def check_ip(self, ip):
        pattern = r'^(\d{1,3}\.){3}\d{1,3}$'
        return bool(re.match(pattern, ip))
    
    # 获取组播地址
    def get_multicast_addr(self, url):
        match = re.search(r'(rtp/|rtp://|udp/|udp://)(.*)', url)
        if match:
            url = match.group(2)
        else:
            url = None
        return url
            
    # 检查URL的有效性
    def check_url(self, url):
        timeout = 3
        return self.valid_url(url, timeout)
    
    # 验证URL的有效性
    def valid_url(self, url, timeout):
        try:
            response = requests.get(url, stream=True, timeout=timeout)
            return response.status_code == 200
        except RequestException:
            return False

    # 检查IPTV的有效性
    def check_iptv(self, url):
        delay = 5
        try:
            response = requests.get(url, timeout=delay)
            if response.status_code == 200:
                # 计算延迟时间
                response_time = response.elapsed.total_seconds()
                if response_time <= delay:
                    return True
                else:
                    return False
            else:
                return False
        except requests.RequestException:
            return False
            
    def request_body(self, url):
        # 发起HTTP请求获取网页内容
        try:
            headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0',
            'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6', 'Accept-Encoding': 'gzip, deflate',
            'Accept': 'ext/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed'
            }
            
            response = requests.get(url, timeout=10, headers={'User-Agent': 'Mozilla/5.0'})
            # 检查响应状态码
            if response.status_code == 200: 
                return response
            else:
                return None
        except (requests.Timeout, requests.RequestException) as e:
            return None
    
    def get_ip_guishu(self, ip):
        # 获取当前时间
        current_time = datetime.now()
        # 资源池
        ip_url = f'https://www.ipshudi.com/{ip}.htm'
        str_guishu = ''
        
        # 发起HTTP请求获取网页内容
        try:
            response = requests.get(ip_url, timeout=10, headers={'User-Agent': 'Mozilla/5.0'})
            # 检查响应状态码
            if response.status_code == 200: 
                #设置编码格式
                response.encoding = 'utf-8'
                # 处理响应
                response.raise_for_status()
                # 检查请求是否成功
                html_content = response.text
                # 使用BeautifulSoup解析网页内容
                soup = BeautifulSoup(html_content, 'html.parser')
                # 查找table中的<tr>标签
                table = soup.find('table')
                raw_list = table.find_all('tr')
                
                ip_add = raw_list[1].find_all('td')[1].text.replace('上报纠错', '').replace(' ', '').strip()
                ip_ips = raw_list[2].find_all('td')[1].text.replace('上报纠错', '').replace(' ', '').strip()
                str_guishu = f"{ip_add}【{ip_ips}】"
            # print(f"{current_time} IP归属地: {str_guishu}")
            return str_guishu
        except (requests.Timeout, requests.RequestException) as e:
            return str_guishu
        '''
        # 酒店源地区
        ip_url = "https://whois.pconline.com.cn/ipJson.jsp?json=true&ip=" + ip
        ip_url = "https://api.pearktrue.cn/api/ip/?ip=" + ip
        ip_response = T.request_body(ip_url)
        if T.check_ip(ip) and ip_response is not None:
            ip_data = ip_response.json()
            return_code = int(ip_data['code'])
            source_name = ip_data['address'] if return_code == 200 else source_name
        '''
    
    # 解析IPTV分辨率等信息
    def get_ffprobe_info(self, url):
        command = ['ffprobe', '-print_format', 'json', '-show_format', '-show_streams', '-v', 'quiet', url]
        
        try:
            # 设置超时时间为10秒
            result = subprocess.run(command, capture_output=True, text=True, timeout=15)
            output = result.stdout
            data = json.loads(output)
            # 获取视频流信息
            video_streams = data['streams']
            width = 0.00
            height = 0
            frame = 0.00
            
            if len(video_streams) > 0:
                stream = video_streams[0]
                # 提取宽度和高度
                width = stream.get('width')
                if width is None:
                    frame = 0
                height = stream.get('height')
                if height is None:
                    height = 0
                # 提取帧速率
                frame = stream.get('r_frame_rate')
                if frame != '0/0' and frame != '':
                    frame = eval(frame)
                else:
                    frame = 0.0
            if width == 0 or height == 0 or frame == 0.0:
                return []
            return [width, height, frame]
        except KeyError:
            # print('无法提取视频流信息：找不到 streams 键')
            return []
        except json.JSONDecodeError:
            # print('无法解析 ffprobe 输出为 JSON 格式')
            return []
        except subprocess.CalledProcessError as e:
            # print("Error: 视频信息无效，解析失败")
            return []
        except subprocess.TimeoutExpired:
            # print("Error: 执行超时")
            return []

    # 获取IPTV播放速度信息
    def get_speed(self, url):
        fornum = 3
        try:
            speeds = []
            average_speed = 0
            
            for _ in range(fornum):
                start_time = time.time()
                response = requests.get(url, stream=True, timeout=10)
                total_bytes = 0
                
                for chunk in response.iter_content(chunk_size=1024):
                    if chunk:
                        total_bytes += len(chunk)
                
                response.close()
                
                current_time = time.time()
                elapsed_time = current_time - start_time
                speed = total_bytes / elapsed_time / 1024  # 计算网速，单位为 Kbps
                speeds.append(speed)
                # print(f"当前网速：{speed:.2f} Kbps")
                
                time.sleep(2)  # 等待2秒
            
            average_speed = sum(speeds) / len(speeds)
            # 格式化平均网速为两位小数
            average_speed = f"{average_speed:.2f}"
            # print(f"平均网速：{average_speed} Kbps")
            return average_speed
        except requests.Timeout:
            # print("请求超时")
            return 0.00
        except requests.RequestException as e:
            # print("请求发生异常:", str(e))
            return 0.00
            
    # 获取IPTV播放速度信息
    def get_ffmpeg_speed(self, url):
        try:
            # 测试或超时时长/秒
            delay = 10
            # 构建FFmpeg命令
            ffmpeg_command = f"ffmpeg -i {url} -t {delay} -f null -"
            
            # 执行FFmpeg命令并捕获输出
            process = subprocess.Popen(ffmpeg_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            stdout, stderr = process.communicate(timeout=20)
            
            # 从FFmpeg输出中提取下载速度
            output_str = stderr.decode("utf-8")
            # print(f"{url} output_str: {output_str}")
            match = re.findall(r'speed=(.*?)x', output_str)
            speed_mbps = 0.00
            # print(f"{url} match: {match}")
            
            if match:
                # 计算速度数组的平均值
                speeds = [float(speed) for speed in match]
                avg_speed_mbps = sum(speeds) / len(speeds)
                speed_mbps = float('{:.2f}'.format(avg_speed_mbps))
            speed_mbps = 0.00 if speed_mbps < 1.00 else speed_mbps
            print(f"{url} 播放速度: {speed_mbps} Mbps")
            return speed_mbps
        except subprocess.CalledProcessError as e:
            # print(f"FFmpeg命令执行失败: {e}")
            return 0.00
        except re.error as e:
            # print(f"正则表达式匹配出现问题: {e}")
            return 0.00
        except Exception as e:
            # print(f"发生了其他异常: {e}")
            return 0.00
            
    def get_category(self, str_name, category_list):
        # 获取当前时间
        current_time = datetime.now()
        # 设置默认值
        category_type = None
        category_name = None
        # 从所有类型结果中匹配频道类型name
        for category_info in category_list:
            # print(f"匹配频道类型 {category_info}，[{str_name}]")
            if category_type is not None:
                break;
            category_psw = category_info[0]
            category_name = category_info[1]
            name_values = category_psw.split(',')
            for name_value in name_values:
                type_alist = ('CCTV1', 'CCTV4', 'CCTV5', 'CCTV8', 'CGTN')
                type_blist = ('CCTV10', 'CCTV11', 'CCTV12', 'CCTV13', 'CCTV14', 'CCTV15', 'CCTV16', 'CCTV17', 'CCTV4K', 'CCTV4欧洲', 'CCTV4美洲', 'CCTV5+', 'CCTV8K', 'CGTN法语', 'CGTN俄语', 'CGTN阿语', 'CGTN西语', 'CGTN记录')
                if category_name in type_alist:
                    if name_value in str_name and not any(type_b in str_name for type_b in type_blist):
                        # print(f"匹配成功1：频道 {category_name}，[{str_name}]中包含[{name_value}]")
                        category_type = category_info[2]
                        break
                else:
                    if name_value in str_name:
                        # print(f"匹配成功2：频道 {category_name}，[{str_name}]中包含[{name_value}]")
                        category_type = category_info[2]
                        break
        category_info = (category_name, category_type)
        return category_info
    
    def convertToM3u(self, txt_file):
        m3u_file = None
        if txt_file.endswith('.txt'):
            m3u_file = txt_file[:-4] + '.m3u'
        # 转换处理
        m3u_output = None
        current_group = None
        with open(txt_file, 'r') as file:
            lines = file.readlines()
            m3u_output = '#EXTM3U x-tvg-url="https://live.fanmingming.com/e.xml"\n'
            for line in lines:
                trimmed_line = line.strip()
                if trimmed_line.strip() != '':
                    if '#genre#' in trimmed_line:
                        current_group = trimmed_line.replace(',#genre#', '').strip()
                    else:
                        original_channel_name, channel_link = [item.strip() for item in trimmed_line.split(',')]
                        m3u_output += f'#EXTINF:-1 tvg-name="{original_channel_name}" tvg-logo="https://live.fanmingming.com/tv/{original_channel_name}.png"'
                        if current_group:
                            m3u_output += f' group-title="{current_group}"'
                        m3u_output += f',{original_channel_name}\n{channel_link}\n'
        
        with open(m3u_file, 'w') as file:
            file.write(m3u_output)
            
        print(f"文件{txt_file} 已成功转换为：{m3u_file}")
        return m3u_file
    
    def convertToM3u_his(self, txt_file):
        m3u_file = None
        if txt_file.endswith('.txt'):
            m3u_file = txt_file[:-4] + '.m3u'
        # 转换处理
        m3u_output = None
        current_group = None
        with open(txt_file, 'r') as file:
            lines = file.readlines()
            m3u_output = '#EXTM3U x-tvg-url="https://live.fanmingming.com/e.xml"\n'
            last_channel_name = None
            for line in lines:
                trimmed_line = line.strip()
                if trimmed_line.strip() != '':
                    if '#genre#' in trimmed_line:
                        current_group = trimmed_line.replace(',#genre#', '').strip()
                        last_channel_name = None
                    else:
                        original_channel_name, channel_link = [item.strip() for item in trimmed_line.split(',')]
                        if last_channel_name == original_channel_name:
                            m3u_output += f'{channel_link}\n'
                        else:
                            m3u_output += f'#EXTINF:-1 tvg-name="{original_channel_name}" tvg-logo="https://live.fanmingming.com/tv/{original_channel_name}.png"'
                            if current_group:
                                m3u_output += f' group-title="{current_group}"'
                            m3u_output += f',{original_channel_name}\n{channel_link}\n'
                        last_channel_name = original_channel_name
        
        with open(m3u_file, 'w') as file:
            file.write(m3u_output)
            
        print(f"文件{txt_file} 已成功转换为：{m3u_file}")
        return m3u_file
    
    def convertToTxt(self, m3u_file):
        txt_file = None
        if m3u_file.endswith('.m3u'):
            txt_file = m3u_file[:-4] + '.txt'
        # 转换处理
        txt_output = ""
        current_group = None
        with open(m3u_file, 'r') as file:
            lines = file.readlines()
            group_title = None
            for line in lines:
                trimmed_line = line.strip()
                # print(f"trimmed_line：{trimmed_line}")
                if trimmed_line.startswith('#EXTINF'):
                    #line1 = lines[i].rstrip('\r\n')
                    #line2 = lines[i+1].rstrip('\r\n')
                    channel_name = trimmed_line[trimmed_line.rfind(',') + 1:]
                    channel_link = lines[lines.index(line) + 1].strip()
                    channel_title = None
                    if 'group-title="' in trimmed_line:
                        channel_title = trimmed_line.split('group-title="')[1].split('"')[0]
                        # print(f"channel_title:{channel_title}")
                    if group_title and group_title != channel_title:
                        txt_output += f"{group_title},#genre#\n"
                        group_title = channel_title
                    else:
                        txt_output += f"{channel_name},{channel_link}\n"
        
        with open(txt_file, 'w') as file:
            file.write(txt_output)
            
        print(f"文件{m3u_file} 已成功转换为：{txt_file}")
        return txt_file
