#  for循环
for var in list:
do
    command;
done

# list可以是一个字符串，也可以是一个序列。
我们可以轻松地生成不同的序列。
#  echo {1..50}能够生成一个从1~50的数字列表。echo {a..z}或{A..Z}或{a..h}可以生 
# 成字母列表。同样，我们可以将这些方法结合起来对数据进行拼接(concatenate)。
# 下面的 代码中，变量i在每次迭代的过程里都会保存一个字符，范围从a~z:
for i in {a..z}; do actions; done;

# for循环也可以采用C语言中for循环的格式。例如:
for((i=0;i<10;i++))
{
    commands; #使用变量$i 
}

#  while循环
  while condition
  do
      commands;
  done
# 用true作为循环条件能够产生无限循环。

#  until循环
# 在Bash中还可以使用一个特殊的循环until。它会一直执行循环，直到给定的条件为真。
x=0;
until [ $x -eq 9 ]; #条件是[$x -eq 9 ] do
    let x++; 
    echo $x;
done