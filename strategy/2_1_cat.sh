从标准输入中读取需要使用管道操作符:
OUTPUT_FROM_SOME COMMANDS | cat

类似地，我们可以用cat将来自输入文件的内容与标准输入拼接在一起，将stdin和另一个 文件中的数据结合起来。方法如下:
这个不知道什么意思
$ echo 'Text through stdin' | cat - file.txt
在上面的代码中，-被作为stdin文本的文件名

1. 摆脱多余的空白行
 有时候文本文件中可能包含多处连续的空白行。如果你需要删除这些额外的空白行，使用下 面的方法:
 $ cat -s file

 2. 将制表符显示为^|
 单从视觉上很难将制表符同连续的空格区分开。而在用Python编写程序时，
 用于代码缩进的 制表符以及空格是具有特殊含义的。因此，若在应该使用空格的地方误用了制表符的话，
 就会产 生缩进错误。仅仅在文本编辑器中进行观察是很难发现这种错误的。cat有一个特性，可以将制 表符着重标记出来。
 该特性对排除缩进错误非常有用。用cat命令的 -T选项能够将制表符标记成 ^|。例如:

 $ cat file.py
    def function():
var = 5
next = 6
third = 7
    $ cat -T file.py
    def function():
    ^Ivar = 5
            next = 6
    ^Ithird = 7^I

3. 行号
 cat -n lines.txt