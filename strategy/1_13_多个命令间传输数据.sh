# 这些命令被称为过滤器(filter)。我们使用管道(pipe)连接每个过滤器。管道操作符
# 是|。例如:

$ cmd1 | cmd2 | cmd3


(1) 先从组合两个命令开始: 
$ ls | cat -n > out.txt

(2) 我们可以用下面的方法读取由管道相连的命令序列的输出:
cmd_output=$(COMMANDS)

这种方法被称为子shell。例如:
cmd_output=$(ls | cat -n)
echo $cmd_output

另一种被称为反引用(有些人们也称它为反标记)的方法也可以用于存储命令输出: cmd_output=`COMMANDS`
例如:
cmd_output=`ls | cat -n`
echo $cmd_output

1. 利用子shell生成一个独立的进程
子shell本身就是独立的进程。可以使用()操作符来定义一个子shell:
pwd;
(cd /bin; ls);
pwd;
当命令在子shell中执行时，不会对当前shell有任何影响;所有的改变仅限于子shell内。例如， 当用cd命令改变子shell的当前目录时，这种变化不会反映到主shell环境中

2. 通过引用子shell的方式保留空格和换行符
假设我们使用子shell或反引用的方法将命令的输出读入一个变量中，可以将它放入双引号 中，以保留空格和换行符(\n)。例如:
$ cat text.txt
    1
    2
    3
    $ out=$(cat text.txt)
    $ echo $out
    1 2 3 # Lost \n spacing in 1,2,3
    $ out="$(cat text.txt)"
    $ echo$out
    1
    2
3