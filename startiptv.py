import tools
import requests
import mysql.connector
from datetime import datetime
from bs4 import BeautifulSoup
from mysql.connector import pooling

# 创建连接池
connection_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="iptv_pool",
    pool_size=5,
    host='192.168.199.119',
    user='iptv',
    password='iptv',
    database='iptv'
)

def source_download():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    # 资源池
    # https://m3u.ibert.me/
    
    # 定义下载文件地址列表
    file_urls = [
        ['https://m3u.ibert.me/txt/o_s_cn_cgtn.txt', 'source/download/o_s_cn_cgtn.txt'],
        ['https://iptv.im2k.com/bjuc.m3u', 'source/download/北京-联通-239.3.1.m3u'],
        ['https://iptv.im2k.com/tjuc.m3u', 'source/multicast/天津-联通-225.1.1.m3u'],
        ['http://github.taoiptv.com/https://raw.githubusercontent.com/qwerttvv/Beijing-IPTV/master/IPTV-Mobile-Multicast.m3u', 'source/multicast/北京-移动-228.1.1.m3u'],
        ['http://github.taoiptv.com/https://raw.githubusercontent.com/qwerttvv/Beijing-IPTV/master/IPTV-Unicom-Multicast.m3u', 'source/multicast/北京-联通-239.3.1.m3u'],
        ['http://github.taoiptv.com/https://raw.githubusercontent.com/akumajac/hebei-iptv/main/%E7%BB%84%E6%92%AD.txt', 'source/multicast/河北-电信-239.254.200.txt'],
        ['http://github.taoiptv.com/https://raw.githubusercontent.com/Tzwcard/ChinaTelecom-GuangdongIPTV-RTP-List/master/GuangdongIPTV_rtp_hd.m3u', 'source/multicast/广东-电信-239.77.1.m3u']
    ]
    # https://live.metshop.top/huyayqk.m3u?url=https://live.metshop.top
    
    for urls in file_urls:
        try:
            file_source = urls[0]
            file_path = urls[1]
            # 下载文件
            # encoded_url = urllib.parse.quote(file_source, safe=':/')
            response = requests.get(file_source, headers={'User-Agent': 'Mozilla/5.0'}, timeout=30)
            with open(file_path, 'wb') as file:
                file.write(response.content)
            #urllib.request.urlretrieve(req, base_source + 'temp.m3u')
            print(f"{current_time} 文件地址：{file_path}，下载成功！")
            if file_path.endswith('.m3u'):
                file_path = T.convertToTxt(file_path)
            
        except Exception as e:
            print(f"{current_time} 文件地址：{file_path}，下载失败:", str(e))
            continue

def sichuan_multicast():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    # 资源池
    sichuan_url = 'http://epg.51zmt.top:8000/sctvmulticast.html'
    file_path = "source/multicast/四川-电信-239.93.0.txt"
    content_response = T.request_body(sichuan_url)
    if content_response is not None:
        # 返回当前的编码格式：ISO-8859-1
        # print(content_response.encoding)
        #设置编码格式
        content_response.encoding = 'utf-8'
        #返回：utf-8，说明上一步设置成功
        # print(content_response.encoding)
        # 处理响应
        content_response.raise_for_status()
        # 检查请求是否成功
        html_content = content_response.text
        # 使用BeautifulSoup解析网页内容
        soup = BeautifulSoup(html_content, 'html.parser')
        # 查找table中的<tr>标签
        table = soup.find('table', {'border': '1'})
        rows_even = table.find_all('tr', class_="even")
        rows_odd = table.find_all('tr', class_="odd")
        raw_list = rows_even + rows_odd
        
        result_txt = ''
        # 循环处理每个结果<tr>标签
        for result_tr in raw_list:
            # print(f"{current_time} result_tr: {result_tr}")
            # 找到所有的<td>标签
            td_tags = result_tr.find_all('td')
            # 获取<td>标签中的名称和地址
            name = td_tags[1].text
            ip_port = td_tags[2].text
            # print(f"{current_time} name: {name}, ip_port: {ip_port}")
            if '画中画' in name or '单音轨' in name:
                continue
            result_txt += f"{name},rtp://{ip_port}\n"
        
        with open(file_path, 'w') as f:
            f.write(result_txt)
        print(f"IPTV数据文件已生成：{file_path}")

def clear_channels():
    # 获取当前时间
    current_time = datetime.now()
    # 获取工具类
    T = tools.Tools()
    
    try:
        # 从连接池获取连接
        cnx = connection_pool.get_connection()
        # 创建游标对象
        cursor = cnx.cursor()
        
        # 删除频道信息
        clear_channels = "TRUNCATE table iptv_channels;"
        cursor.execute(clear_channels)
        cnx.commit()
        
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
        print(f"{current_time} IPTV频道信息处理，主程序执行开始")
        
        # 每周六下载资源
        if weekday == 6:
            print(f"{current_time} 当前时间：周{weekday}，执行资源下载")
            # 下载资源文件
            source_download()
            # 下载四川组播
            sichuan_multicast()
        else:
            print(f"{current_time} 当前时间：周{weekday}，不执行资源下载")
            
        # 清理频道信息
        clear_channels()
        print(f"{current_time} IPTV频道历史信息清除完成，后续增量处理开始")
        
    except Exception as e:
        print(f"发生了其他异常: {e}")

# 执行主程序函数
main_function()

