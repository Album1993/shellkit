(1) 定义函数:
   function fname()
   {
       statements;
   }
或者:
fname() {
       statements;
   }

(2) 只需要使用函数名就可以调用某个函数: 
$ fname ; #执行函数


参数可以传递给函数，并由脚本进行访问:
fname arg1 arg2 ; #传递参数

fname() {
echo $1, $2; #访问参数1和参数2
echo "$@";#以列表的方式一次性打印所有参数
echo "$*"; #类似于$@，但是参数被作为单个实体 
return 0; #返回值
}

 $1是第一个参数。
 $2是第二个参数。
 $n是第n个参数。
 "$@" 被扩展成 "$1" "$2" "$3"等。
 "$*" 被扩展成 "$1c$2c$3"，其中c是IFS的第一个字符。
 "$@" 要比"$*"用得多。由于 "$*"将所有的参数当做单个字符串，因此它很少被
使用。

fork 炸弹
F() { echo $1; F hello; sleep 1; }

2. 导出函数
函数也能像环境变量一样用export导出，如此一来，函数的作用域就可以扩展到子进程中，
例如:
    export -f fname

3. 读取命令返回值(状态)
我们可以按照下面的方式获取命令或函数的返回值:
cmd; echo $?;
$? 会给出命令cmd的返回值。
返回值被称为退出状态。它可用于分析命令执行成功与否。如果命令成功退出，那么退出状
态为0，否则为非0。
我们可以按照下面的方法检测某个命令是否成功结束:
#!/bin/bash
#文件名: success_test.sh
CMD="command" #command指代你要检测退出状态的目标命令 $CMD
if [ $? -eq 0 ];
then
        echo "$CMD executed successfully"
    else
        echo "$CMD terminated unsuccessfully"
    fi

4. 向命令传递参数
命令的参数能够以不同的格式进行传递。假设-p、-v是可用选项，-k N是另一个可以接受
数字的选项，同时该命令还接受一个文件名作为参数，那么，它有如下几种执行方式:
 $ command -p -v -k 1 file 
 $ command -pv -k 1 file 
 $ command -vpk 1 file
 $ command file -pvk 1