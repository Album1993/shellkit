
 0 —— stdin(标准输入)。
 1 —— stdout(标准输出)。
 2 —— stderr(标准错误)

(1) 用下面的方法可以将输出文本重定向或保存到一个文件中:
$ echo "This is a sample text 1" > temp.txt

(2) 将文本追加到目标文件中，看下面的例子:
$ echo "This is sample text 2" >> temp.txt

# 你可以将stderr单独重定向到一个文件，将stdout重定向到另一个文件:
ls + 2> out.txt #正常运行

# 你可以将stderr单独重定向到一个文件，将stdout重定向到另一个文件:
$ cmd 2>stderr.txt 1>stdout.txt

# 还可以利用下面这个更好的方法将stderr转换成stdout，使得stderr和stdout 都被重定向到同一个文件中:
$ cmd 2>&1 output.txt
或者这样:
$ cmd &> output.txt

# 如果你不想让终端 中充斥着有关stderr的繁枝末节，那么你可以将stderr的输出重定向到 /dev/null
cmd 2>/dev/null

(6) 但是有一个方法既可以将数据重定向到文件，还可以提供一份重定向数据的副本作 为后续命令的stdin。这一切都可以使用tee来实现。举个例子:要在终端中打印 stdout，同时将它重定向到一个文件中，那么可以这样使用tee:
   command | tee FILE1 FILE2
#    在下面的代码中，tee命令接收到来自stdin的数据。它将stdout的一份副本写入 文件out.txt，同时将另一份副本作为后续命令的stdin。命令cat -n将从stdin中接 收到的每一行数据前加上行号并写入stdout:
$ cat a* | tee out.txt | cat -n
cat: a1: Permission denied
1a1
2a1
# 查看out.txt的内容:
$ cat out.txt
a1
a1
# 注意，cat: a1: Permission denied 并没有在文件内容中出现。这是因为这些 信息属于stderr，而tee只能从stdin中读取。

(7) 我们可以使用stdin作为命令参数。只需要将-作为命令的文件名参数即可:
   $ cmd1 | cmd2 | cmd -
# 例如:
   $ echo who is this | tee -
   who is this
   who is this
#   也可以将 /dev/stdin作为输出文件名来代替stdin。
# 类似地，使用 /dev/stderr代表标准错误，/dev/stdout代表标准输出。这些特殊的设备
#  文件分别对应stdin、stderr和stdout。

# 从stdin读取输入的命令能以多种方式接收数据。也可以用cat和管道来指定我们自己的文
#   件描述符，例如:
$ cat file | cmd
$ cmd1 | cmd

2. 将脚本内部的文本块进行重定向
有时候，我们需要对文本块(多行文本)进行重定向，就像对标准输入做的那样。考虑一个 特殊情况:源文本就位于shell脚本中。一个实用的例子是向log文件中写入头部数据，可以按照下 面的方法完成:
'''
     #!/bin/bash
     cat<<EOF>log.txt
     LOG FILE HEADER
     This is a test log file
     Function: System statistics
     EOF
# 在cat <<EOF>log.txt与下一个EOF行之间的所有文本行都会被当做stdin数据。log.txt 文件的内容打印如下:
     $ cat log.txt
     LOG FILE HEADER
     This is a test log file
     Function: System statistics
'''



3. 自定义文件描述符
# 文件描述符是一种用于访问文件的抽象指示器(abstract indicator)。存取文件离不开被称为
# “文件描述符”的特殊数字。0、1和2分别是stdin、stdout和stderr的预留描述符编号。 我们可以使用exec命令创建自己的文件描述符。如果你对用其他编程语言进行文件编程非
# 常熟悉，你可能已经注意到了文件打开模式。通常会用到3种模式。
#  只读模式。
#  截断写入模式。  追加写入模式。
# < 操作符用于从文件中读取至stdin。> 操作符用于截断模式的文件写入(数据在目标文件 内容被截断之后写入)。>>操作符用于追加模式的文件写入。(数据被添加到文件的现有内容中， 而且该目标文件中原有的内容不会丢失。)文件描述符可以用以上三种模式中的任意一种来创建。
#   创建一个文件描述符进行文件读取:
$ exec 3<input.txt #使用文件描述符3打开并读取文件

# 我们可以这样使用它:
$ echo this is a test line > input.txt
$ exec 3<input.txt
# 现在你就可以在命令中使用文件描述符3了。例如: $ cat<&3
this is a test line
#  如果要再次读取，我们就不能继续使用文件描述符3了，而是需要用exec重新分配文件描述 符3来进行二次读取。
#  创建一个文件描述符用于写入(截断模式):
$ exec 4>output.txt #打开文件进行写入 例如:
    $ exec 4>output.txt
    $ echo newline >&4
    $ cat output.txt
    newline
# 创建一个文件描述符用于写入(追加模式):
    $ exec 5>>input.txt
# 例如:
    $ exec 5>>input.txt
    $ echo appended line >&5
    $ cat input.txt
    newline
    appended line
     