# 下面的语句从输入中读取n个字符并存入变量variable_name:

read -n number_of_chars variable_name
例如:
$ read -n 2 var
$ echo $var

# (2) 用无回显的方式读取密码: 
read -s var
# (3) 显示提示信息:
read -p "Enter input:" var
# (4) 在特定时限内读取输入:
read -t timeout var
# 例如:
$ read -t 2 var #在2秒内将键入的字符串读入变量var
# (5) 用特定的定界符作为输入行的结束: read -d delim_char var
# 例如:
$ read -d ":" var
hello:#var 被设置为 hello