#对于进程来说，其运行时的环境变量可以使用下面的命令 来查看
# cat /proc/$PID/environ

# linux
# pgrep命令获得gedit的进程ID
pgrep gedit
# 你就可以通过以下命令获得与该进程相关的环境变量
cat /proc/12501/environ
# 使得每一行显示一组“变量=值”
cat /proc/12501/environ  | tr '\0' '\n'

# var = value不同于var=value。把var=value写成var = value是一个常见的错误， 但前者是赋值操作，后者则是相等操作
var="value"
fruit=apple
count=5
echo "We have $count ${fruit}(s)"
printf "We have $count ${fruit}(s)"

# $var will print value
echo '$var' will print $var

# export命令用来设置环境变量。至此之后，从当前shell脚本执行的任何应用程序都会继承 这个变量
HTTP_PROXY=192.168.1.23:3128
export HTTP_PROXY


echo $PATH
export PATH="$PATH:/home/user/bin"
# 也可以使用
PATH="$PATH:/home/user/bin"
export PATH
echo $PATH

# length就是字符串所包含的字符数。
var=12345678901234567890$
echo ${#var}

# 获知当前使用的是哪种shell
echo $SHELL
echo $0


# UID是一个重要的环境变量，可以用于检查当前脚本是以超级用户还是以普通用户的身份运行的
# root用户的UID是0。
if [ $UID -ne 0 ]; then
        echo Non root user. Please run as root.
    else
        echo Root user
fi

# linux 可以，mac os 不行
# 可以使用如下命令列出设置变量PS1的那一行: $ cat ~/.bashrc | grep PS1
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# 如果要设置一个定制的提示字符串，可以输入:
slynux@localhost: ~$ PS1="PROMPT>"
# 我们可以利用类似\e[1;31的特定转义序列来设置彩色的提示字符串(参考1.2节的内容)
# 还有一些特殊的字符可以扩展成系统参数。例如:\u可以扩展为用户名，\h可以扩展为主机名，而\w可以扩展为当前工作目录
