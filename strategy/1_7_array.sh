array_var=(1 2 3 4 5 6) #这些值将会存储在以0为起始索引的连续位置上


# 另外，还可以将数组定义成一组“索引-值”:
array_var[0]="test1"
array_var[1]="test2"
array_var[2]="test3"
array_var[3]="test4"
array_var[4]="test5"
array_var[5]="test6"


# 打印出特定索引的数组元素内容
echo ${array_var[0]}
test1
index=5
echo ${array_var[$index]}
test6

#这样是将ls 输出的东西一个一个放进数组中 ，
i=1
for file in `ls `;do
A[$i]=$file
((i++))
done
for value in ${A[*]}
do
 # 这个就是正常的有间断的
echo $value
echo hh

done

# 这两种都是错误的实践
ARRAY=`ls`
for myfile in $ARRAY
do
#array中间貌似所有每个下标只对应一个字母
#这时候会将 array中间所有内容输出再接上一个hh
   echo $myfile
   echo hh

done

ARRAY=`ls`
for myfile in ${ARRAY[*]}
do
#array中间貌似所有每个下标只对应一个字母
#这时候会将 array中间所有内容输出再接上一个hh
   echo $myfile
   echo hh
done


# 以清单形式打印出数组中的所有值:
$ echo ${array_var[*]}
test1 test2 test3 test4 test5 test6
# 也可以这样使用:
$ echo ${array_var[@]}
test1 test2 test3 test4 test5 test6

# 打印数组长度(即数组中元素的个数):
$ echo ${#array_var[*]}
6


# 索引数组
declare -A fruits_value
# zsh 好像这种方式不行
$ fruits_value=([apple]='100dollars' [orange]='150 dollars')
# zsh这种方式可行
$ ass_array[index1]=val1
$ ass_array[index2]=val2

echo "Apple costs ${fruits_value[apple]}"
Apple costs 100 dollars

获取数组的索引列表
echo ${!array_var[*]}
echo ${!array_var[@]

