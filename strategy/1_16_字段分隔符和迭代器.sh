# 我们需要迭代一个字符串或逗号分隔型数值(Comma Separated Value，CSV)中 的单词。如果是前一种，则使用IFS=".";如果是后一种，则使用IFS=","
# 考虑CSV数据的情况: data="name,sex,rollno,location"
# 我们可以使用IFS读取变量中的每一个条目。
    oldIFS=$IFS
    IFS=, now,
    for item in $data;
    do
        echo Item: $item
    done
IFS=$oldIFS
# 输出如下:
    Item: name
    Item: sex
    Item: rollno
    Item: location
# IFS的默认值为空白字符(换行符、制表符或者空格)。
# 当IFS被设置为逗号时，shell将逗号视为一个定界符，因此变量$item在每次迭代中读取由
# 逗号分隔的子串作为变量值。 如果没有把IFS设置成逗号，那么上面的脚本会将全部数据作为单个字符串打印出来。


# 考虑这样的输入:root:x:0:0:root:/root:/bin/bash。每行的最后一项指定了用户的
# 默认shell。可以按照下面的方法巧妙地利用IFS打印出用户以及他们默认的shell:
#!/bin/bash
#用途: 演示IFS的用法 line="root:x:0:0:root:/root:/bin/bash" oldIFS=$IFS;
IFS=":"
count=0
for item in $line;
do
    [ $count -eq 0 ]  && user=$item;
    [ $count -eq 6 ]  && shell=$item;
    let count++
done;
IFS=$oldIFS
echo $user\'s shell is $shell;

# 输出为:
root's shell is /bin/bash