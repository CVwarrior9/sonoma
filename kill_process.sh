#!/bin/bash

# 使用sudo权限执行脚本
if [ "$EUID" -ne 0 ]; then
    echo "请使用sudo权限运行此脚本（关闭墙纸进程脚本）"
    exit
fi

# 使用pgrep命令查找包含"legacyScreenSaver"关键词的进程ID
process_ids=$(pgrep -i "legacyScreenSaver")

# 检查是否找到了匹配的进程
if [ -z "$process_ids" ]; then
    echo "未找到包含'legacyScreenSaver'关键词的进程。"
else
    # 循环结束每个匹配的进程
    for pid in $process_ids; do
        echo "结束进程 $pid"
        # 使用kill命令结束进程，-9参数表示强制结束
        kill -9 $pid
    done
    echo "所有包含'legacyScreenSaver'关键词的进程已结束。"
fi

# ************************************开启定时任务********************************************
# 1.打开终端并输入以下命令以编辑cron作业：
# sudo crontab -e
# 2.在打开的编辑器中，添加以下行来设置定时任务：
# 0 */4 * * * sh /path/to/your/script.sh
# 请将/path/to/your/script.sh替换为你脚本的实际路径。这个cron作业的含义是每隔4小时执行一次指定的脚本。
# 3.保存并退出编辑器。
# exc -> :wq  
# 这样，你的脚本就会每隔四个小时自动运行一次了。


# ************************************相反 关闭定时任务********************************************
# crontab -e
# 删除或者注释掉这个定时任务
# 保存并退出编辑器。
# exc -> :wq 