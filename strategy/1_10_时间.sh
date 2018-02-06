# Thu May 20 23:09:04 IST 2010
# 读取日期
date

# 打印纪元时:
$ date +%s
1290047248

# 要将日期串转换成纪元时，只需要这样即可实现
$ date --date "Thu Nov 18 08:07:21 IST 2010" +%s
# 1290047841

# 将日期串作为输入能够用来获知给定的日期是星期几
$ date --date "Jan 20 2001" +%A
Saturday


# 用格式串结合 + 作为date命令的参数，可以按照你的选择打印出对应格式的日期
date "+%d %B %Y"
20 May 2010

# 设置日期和时间
date -s "格式化的日期字符串"
date -s "21 June 2009 11:01:22"


# 检查一组命令所花费的时间

#!/bin/bash
#文件名: time_take.sh
# 另一种方法则是使用time<scriptpath>来得到执行脚本所花 费的时间。
start=$(date +%s)
commands; 7 statements;
end=$(date +%s)
difference=$(( end - start))
echo Time taken to execute commands is $difference seconds.




日期内容 格式

星期                         %a(例如:Sat) %A(例如:Saturday)
月                           %b(例如:Nov) %B(例如:November)
日                           %d(例如:31)
固定格式日期(mm/dd/yy)         %D(例如:10/18/10)
年                           %y(例如:10)%Y(例如:2010)
小时                          %I或%H(例如:08)
分钟                          %M(例如:33)
秒                            %S(例如:10)
纳秒                          %N(例如:695208515)
Unix纪元时(以秒为单位)          %s(例如:1290049486)


# 在脚本中生成延时
# 为了在脚本中推迟执行一段时间，可以使用sleep:$ sleep no_of_seconds.例如，下面 的脚本就使用tput和sleep从0开始计数到40
#!/bin/bash #文件名: sleep.sh echo -n Count: tput sc
# 恢复光标位置的命令是tput rc。tput ed清除从当前光标位置到行尾之 间的所有内容
count=0;
while true;
       
do
    if [ $count -lt 40 ];
    then
        let count++;
        sleep 1;
        tput rc
        tput ed
        echo -n $count;
    else exit 0;
    fi 
done