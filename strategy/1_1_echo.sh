#!/bin/zsh


echo "welcome to bash"
echo welcome to bash
echo 'test in quotes'

# 那就不要将其放入双引号中，或者你可以在其之前加上一个特殊的 转义字符(\)将!转义
# echo "cannot include exclamation - ! within double quotes"

# 使用不带引号的echo时，没法在所要显示的文本中使用分号(;)，因为分号在Bash shell 中被用作命令定界符。
echo Hello world !

# 变量替换在单引号中无效
echo 'Hello world !'
echo "Hello world \!" #将转义字符放在前面

# %s、%c、%d和%f都是格式替换符(format substitution character)，其所对应的参数可以置于
# 带引号的格式字符串之后。
#  %-5s指明了一个格式为左对齐且宽度为5的字符串替换(-表示左对齐)。如果不用-指定对 齐方式，字符串就采用右对齐形式。宽度指定了保留给某个变量的字符数。对Name而言，保留 宽度是10。因此，任何Name字段的内容都会被显示在10字符宽的保留区域内，如果内容不足10 个字符，余下的则以空格符填充。
# 对于浮点数，可以使用其他参数对小数部分进行舍入。 对于Mark字段，将其格式化为%-4.2f，其中.2指定保留2个小数位。注意，在每行格式字符
#  串后都有一个换行符(\n)。
printf "Hello world"
printf  "%-5s %-10s %-4s\n" No Name  Mark
printf  "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456
printf  "%-5s %-10s %-4.2f\n" 2 James 90.9989
printf  "%-5s %-10s %-4.2f\n" 3 Jeff 77.564

# 可以使用选项-n来忽略结尾 的换行符
echo -n "hello"

# echo –e "包含转义序列的字符串"
echo -e "1\t2\t3"

# 比如:重置=0，黑色=30，红色=31，绿色=32，黄色=33，蓝 色=34，洋红=35，青色=36，白色=37。
echo -e "\e[1;31m This is red text \e[0m"

# 要设置彩色背景，经常使用的颜色码是:重置=0，黑色=40，红色=41，绿色=42，黄色=43，
# 蓝色=44，洋红=45，青色=46，白色=47。
echo -e "\e[1;42m Green Background \e[0m"


