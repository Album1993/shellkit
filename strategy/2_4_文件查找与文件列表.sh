$ findint
# 打印文件和目录的列表

当使用 -print时，'\n'作为用于对输出的文件名进行分隔。就算你忽略-print，find命令仍会打印出文件名
-print0指明使用'\0'作为匹配的文件名之间的定界符。当文件名中包含换行符时，这个方法就有用武之地了。


1. 根据文件名或正则表达式进行搜索
选项–name的参数指定了文件名所必须匹配的字符串。我们可以将通配符作为参数使用。 
*.txt能够匹配所有以.txt结尾的文件名。选项 -print在终端中打印出符合条件(例如 -name) 的文件名或文件路径，这些匹配条件通过find命令的选项给出

$ find /home/slynux -name "*.txt" -print

find命令有一个选项 -iname(忽略字母大小写)，该选项的作用和 -name类似，只不过在 匹配名字时会忽略大小写。

例如:
$ ls
example.txt  EXAMPLE.txt  file.txt
$ find . -iname "example*" -print
./example.txt
./EXAMPLE.txt
如果想匹配多个条件中的一个，可以采用OR条件操作:
$ ls
new.txt  some.jpg  text.pdf
$ find . \( -name "*.txt" -o -name "*.pdf" \) -print
./text.pdf
./new.txt
上面的代码会打印出所有的.txt和.pdf文件，是因为这个find命令能够匹配所有这两类文件。 \(以及\)用于将 -name "*.txt" -o -name "*.pdf"视为一个整体。
选项-path的参数可以使用通配符来匹配文件路径。-name总是用给定的文件名进行匹配。
-path则将文件路径作为一个整体进行匹配。例如: $ find /home/users -path "*/slynux/*" -print
这会匹配以下路径:
/home/users/list/slynux.txt
/home/users/slynux/eg.css
选项-regex的参数和-path的类似，只不过-regex是基于正则表达式来匹 配文件路径的。

正则表达式是通配符匹配的高级形式，它可以指定文本模式。我们借助这种模式来匹配文本 及进行打印。使用正则表达式进行文本匹配的一个典型例子就是从一堆文本中解析出所有的 E-mail地址。E-mail地址通常采用name@host.root这种形式，所以可以将其一般化为[a-z0-9]+ @[a-z0-9]+.[a-z0-9]+。符号+ 指明在它之前的字符类中的字符可以出现一次或多次。
下面的命令匹配.py或.sh文件:
    $ ls
    new.PY  next.jpg  test.py
    $ find . -regex ".*\(\.py\|\.sh\)$"
    ./test.py
类似地，-iregex可以让正则表达式忽略大小写。例如:
字符串中的（和. 都是需要转意的
    $ find . -iregex ".*\(\.py\|\.sh\)$"
    ./test.py
    ./new.PY

2. 否定参数
find也可以用“!”否定参数的含义。例如: $ find . ! -name "*.txt" -print
上面的find命令能够匹配所有不以.txt结尾的文件名。下面就是这个命令的运行结果: $ ls
    list.txt  new.PY  new.txt  next.jpg  test.py
    $ find . ! -name "*.txt" -print
    .
    ./next.jpg
    ./test.py
    ./new.PY

3. 基于目录深度的搜索 find命令在使用时会遍历所有的子目录。我们可以采用深度选项-maxdepth和 -mindepth
 来限制find命令遍历的目录深度。
-mindepth类似于 -maxdepth，不过它设置的是find开始遍历的最小深度。这个选项可以 用来查找并打印那些距离起始路径一定深度的所有文件。例如，打印出深度距离当前目录至少两 5 个子目录的所有文件:
大多数情况下，我们只需要在当前目录中进行搜索，无须再继续向下查找。对于这种情况， 我们使用深度选项来限制find命令向下查找的深度。如果只允许find在当前目录中查找，深度 可以设置为1;当需要向下两级时，深度可以设置为2;其他情况可以依次类推。
 可以用-maxzdepth指定最大深度。与此相似，我们也可以指定一个最小的深度，告诉find 应该从此处开始向下查找。如果我们想从第二级目录开始搜索，那么就使用 -mindepth设置最 小深度。使用下列命令将find命令向下的最大深度限制为1:


 $ find . -mindepth 2 -name "f*" -print
./dir1/dir2/file1
./dir3/dir4/f2
即使当前目录或dir1和dir3中包含有文件，它们也不会被打印出来。

-maxdepth和-mindepth应该作为find的第三个参数出现。
如果作为第4 个或之后的参数，就可能会影响到find的效率，因为它不得不进行一些不必要 的检查。
例如，如果-maxdepth作为第四个参数，-type作为第三个参数，find 首先会找出符合-type的所有文件，然后在所有匹配的文件中再找出符合指定深 度的那些。
但是如果反过来，目录深度作为第三个参数，-type作为第四个参数， 那么find就能够在找到所有符合指定深度的文件后，再检查这些文件的类型， 这才是最有效的搜索之道。

4. 根据文件类型搜索
Unix类系统将一切都视为文件。文件具有不同的类型，例如普通文件、目录、字符设备、块 设备、符号链接、硬链接、套接字以及FIFO等。
-type可以对文件搜索进行过滤。借助这个选项，我们可以为find命令指明特定的文件匹配
类型。
  只列出所有的目录:
    $ find . -type d -print
将文件和目录分别列出可不是个容易事。不过有了find就好办了。例如，只列出普通文件: $ find . -type f -print
只列出符号链接:
    $ find . -type l -print
你可以按照表2-1列出的内容用type参数来匹配所需要的文件类型


文件类型      类型参数
普通文件        f
符号链接        l
目录            d
字符设备        c
块设备         b
套接字         s 
FIFO          p

Unix/Linux文件系统中的每一个文件都有三种时间戳，如下所示。
 访问时间(-atime):用户最近一次访问文件的时间。
 修改时间(-mtime):文件内容最后一次被修改的时间。
 变化时间(-ctime):文件元数据(例如权限或所有权)最后一次改变的时间。

在Unix中并没有所谓“创建时间”的概念。

-atime、-mtime、-ctime可作为find的时间选项。它们可以用整数值指定，单位是天。
这些整数值通常还带有 - 或 + :- 表示小于，+ 表示大于。

打印出在最近7天内被访问过的所有文件:
find . -type f -atime -7 -print
 打印出恰好在7天前被访问过的所有文件:
$ find . -type f -atime 7 -print
 打印出访问时间超过7天的所有文件: 
$ find . -type f -atime +7 -print
2.4 文件查找与文件列表 51
 类似地，我们可以根据修改时间，用-mtime进行搜索，也可以根据变化时间，用-ctime进 行搜索。
 -atime、-mtime以及-ctime都是基于时间的参数，其计量单位是“天”。还有其他一些基 于时间的参数是以分钟作为计量单位的。这些参数包括:
 -amin(访问时间);  -mmin(修改时间);  -cmin(变化时间)。
举例如下。 打印出访问时间超过7分钟的所有文件:
$ find . -type f -amin +7 -print
find另一个漂亮的特性是 -newer参数。使用 -newer，我们可以指定一个用于比较时间戳 的参考文件，然后找出比参考文件更新的(更近的修改时间)所有文件。
 例如，找出比file.txt修改时间更近的所有文件: $ find . -type f -newer file.txt -print
find命令的时间戳处理选项对编写系统备份和维护脚本很有帮助。

6. 基于文件大小的搜索
根据文件的大小，可以这样搜索:
$ find . -type f -size +2k # 大于2KB的文件
$ find . -type f -size -2k # 小于2KB的文件
$ find . -type f -size 2k # 大小等于2KB的文件

除了k之外，还可以用其他文件大小单元。
 b —— 块(512字节)。  c —— 字节。
 w —— 字(2字节)。  k —— 1024字节。
 M —— 1024K字节。  G —— 1024M字节。
7. 删除匹配的文件 -delete可以用来删除find查找到的匹配文件。
删除当前目录下所有的 .swp文件:
$ find . -type f -name "*.swp" -delete


8. 基于文件权限和所有权的匹配
也可以根据文件权限进行文件匹配。列出具有特定权限的所有文件:
$ find . -type f -perm 644 -print # 打印出权限为644的文件
-perm指明find应该只匹配具有特定权限值的文件。文件权限会在3.5节进行讲解。 以Apache Web服务器为例。Web服务器上的PHP文件需要具有合适的执行权限。我们可以用
下面的方法找出那些没有设置好执行权限的PHP文件:
$ find . -type f -name "*.php" ! -perm 644 -print
也可以根据文件的所有权进行搜索。用选项 -user USER就能够找出由某个特定用户所拥有 的文件。
参数USER可以是用户名或UID。 例如，打印出用户slynux拥有的所有文件:
$ find . -type f -user slynux -print

 9. 利用find执行命令或动作
find命令可以借助选项-exec与其他命名进行结合。-exec算得上是find最强大的特性之一。
在前一节中，我们用 -perm找出了所有权限不当的PHP文件。这次的任务也差不多，我们需 要将某位用户(比如root)全部文件的所有权更改成另一位用户(比如Web服务器默认的Apache 用户www-data)，
那么就可以用 -user找出root拥有的所有文件，然后用-exec更改所有权。
# find . -type f -user root -exec chown slynux {} \;
在这个命令中，{}是一个与 -exec选项搭配使用的特殊字符串。对于每一个匹配的文件， {}会被替换成相应的文件名。例如，find命令找到两个文件test1.txt和test2.txt，其所有者均为 slynux，那么find就会执行:
 chown slynux {}
它会被解析为chown slynux test1.txt和chown slynux test2.txt。
只是获取文件列表

另一个例子是将给定目录中的所有C程序文件拼接起来写入单个文件all_c_files.txt。我们可以 用find找到所有的C文件，然后结合 -exec使用cat命令:
$ find . -type f -name "*.c" -exec cat {} \;>all_c_files.txt

-exec之后可以接任何命令。{}表示一个匹配。对于任何匹配的文件名，{}均会被该文件名 所替换。
 我们使用 > 操作符将来自find的数据重定向到all_c_files.txt文件，没有使用>>(追加)的原因是因为find命令的全部输出就只有一个数据流(stdin)，而只有当多个数据流被追加到单个文件中时才有必要使用>>。
 例如，用下列命令将10天前的 .txt文件复制到OLD目录中: 7 $ find . -type f -mtime +10 -name "*.txt" -exec cp {} OLD \;
 find命令同样可以采用类似的方法与其他命令结合起来。


-exec结合多个命令 我们无法在-exec参数中直接使用多个命令。它只能够接受单个命令，不过
我们可以耍一个小花招。把多个命令写到一个shell脚本中(例如command.sh)，然后在-exec中使用这个脚本: -exec ./commands.sh {} \;

-exec能够同printf结合来生成有用的输出信息。例如:
    $ find . -type f -name "*.txt" -exec printf "Text file: %s\n" {} \;

10. 让find跳过特定的目录
在搜索目录并执行某些操作时，有时为了提高性能，需要跳过一些子目录。例如，程序员会 在版本控制系统(如Git)管理的开发源码树中查找特定的文件，源代码层级结构中的每个子目 录里都会包含一个.git目录。(.git存储每个目录相关的版本控制信息。)
因为与版本控制相关的目录对我们而言并没有什么用处，所以没必要去搜索这些目录。将某些文件或目录从搜索过程中排 除在外的技巧被称为修剪，其操作方法如下:
    $ find devel/source_path  \( -name ".git" -prune \) -o \( -type f -print \)
# Instead of \( -type -print \),而是选择需要的过滤器
以上命令打印出不包括在.git目录中的所有文件的名称(路径)。
\( -name ".git" -prune \)的作用是用于进行排除，它指明了 .git目录应该被排除在外， 
而\( -type f -print \)指明了需要执行的动作。这些动作需要被放置在第二个语句块中(打印出所有文件的名称和路径)。