# 获取终端的行数和列数:
tput cols
tput lines


#  打印出当前终端名
tput longname

# 将光标移动到坐标(100,100)处
tput cup 100 100

#  linux
#  设置终端背景色
tputsetb n

# 设置下划线的起止: 
tput smul
tput rmul

# 删除从当前光标位置到行尾的所有内容: 
tputed


# 在输入密码时，不应该显示输入内容
# 选项-echo禁止将输出发送到终端，而选项echo则允许发送输出。

#!/bin/sh
#Filename: password.sh
echo -e "Enter password: "
stty -echo
read password
stty echo
echo
echo Password read.


# 恢复光标位置的命令是 (具体用法见1_10_时间.sh)
tput rc

# 清除从当前光标位置到行尾之 间的所有内容
tput ed