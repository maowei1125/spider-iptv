import subprocess

# 定义要执行的命令
commands = ['python3 startiptv.py', 'python3 hotels.py', 'python3 multicast.py', 'python3 iptvdata.py']

'''
# 启动第一个脚本的进程
processes = [subprocess.Popen(commands[0], shell=True)]

# 同时执行第二个和第三个脚本的进程
processes.extend([subprocess.Popen(command, shell=True) for command in commands[1:3]])

# 等待所有进程执行完成
for process in processes:
    process.communicate()

# 执行第四个脚本
subprocess.call(commands[3], shell=True)
'''

# 逐个执行命令
for command in commands:
    # 执行命令
    subprocess.call(command, shell=True)

