if condition;
then
commands; 
fi

if condition;
then
    commands;
else if condition; then
    commands;
else
commands; 
fi

 [ condition ] && action; # 如果condition为真，则执行action;
 [ condition ] || action; # 如果condition为假，则执行action。


条件通常被放置在封闭的中括号内。一定要注意在[或]与操作数之间有一个空格。如果
 忘记了这个空格，脚本就会报错。例如:
  [$var -eq 0 ] or [ $var -eq 0]
 对变量或值进行算术条件判断:
[$var-eq0] #当$var等于0时，返回真 [ $var -ne 0 ] #当 $var 为非 0 时，返回真
 其他重要的操作符如下所示。
 -gt:大于。
 -lt:小于。
 -ge:大于或等于。  -le:小于或等于。
 可以按照下面的方法结合多个条件进行测试:
[ $var1 -ne 0 -a $var2 -gt 2 ] #使用逻辑与-a [ $var1 -ne 0 -o var2 -gt 2 ] #逻辑或 -o


 [ -f $file_var ]:如果给定的变量包含正常的文件路径或文件名，则返回真。  [ -x $var ]:如果给定的变量包含的文件可执行，则返回真。
 [ -d $var ]:如果给定的变量包含的是目录，则返回真。
 [ -e $var ]:如果给定的变量包含的文件存在，则返回真。
  [ -c $var ]:如果给定的变量包含的是一个字符设备文件的路径，则返回真。  [ -b $var ]:如果给定的变量包含的是一个块设备文件的路径，则返回真。
 [ -w $var ]:如果给定的变量包含的文件可写，则返回真。
 [ -r $var ]:如果给定的变量包含的文件可读，则返回真。
 [ -L $var ]:如果给定的变量包含的是一个符号链接，则返回真。
-x filename 	如果 filename可执行，则为真 	[ -x /usr/bin/grep ]
fpath="/etc/passwd"
if [ -e $fpath ]; then
    echo File exists;
else
    echo Does not exist;
fi

 可以用下面的方法检查两个字符串，看看它们是否相同。
 [[ $str1 = $str2 ]]:当str1等于str2时，返回真。也就是说，str1和str2包含 的文本是一模一样的。
 [[ $str1 == $str2 ]]:这是检查字符串是否相等的另一种写法。 也可以检查两个字符串是否不同。
 [[ $str1 != $str2 ]]:如果str1和str2不相同，则返回真。 我们还可以检查字符串的字母序情况，具体如下所示。
 [[ $str1 > $str2 ]]:如果str1的字母序比str2大，则返回真。  [[ $str1 < $str2 ]]:如果str1的字母序比str2小，则返回真。  [[ -z $str1 ]]:如果str1包含的是空字符串，则返回真。
 [[ -n $str1 ]]:如果str1包含的是空字符串，则返回真
 [[ -n $str1 ]]:如果str1包含的是非空字符串，则返回真。
注意在= 前后各有一个空格。如果忘记加空格，那就不是比 较关系了，而变成了赋值语句。

 str1="Not empty "
     str2=""
     if [[ -n $str1 ]] && [[ -z $str2 ]];
     then
         echo str1 is nonempty and str2 is empty string.
     fi
test命令可以用来执行条件检测。用test可以避免使用过多的括号。之前讲过的[]中的测试条件同样可以用于test命令。 例如:
    if  [ $var -eq 0 ]; then echo "True"; fi
也可以写成:
    if  test $var -eq 0 ; then echo "True"; fi