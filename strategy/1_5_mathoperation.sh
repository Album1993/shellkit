#!/bin/zsh

no1=4;
no2=5;

# 当使用let时，变量名之前不需要再添加$
let result=no1+no2
echo $result

# 自加操作
let no1++

# 自减操作
let no1--

# 简写形式 let no+=6
let no-=6

# 操作符[]的使用方法和let命令类似:
result=$[ no1 + no2 ]
# 在[]中也可以使用$前缀，例如:
result=$[ $no1 + 5
# 也可以使用(())，但使用(())时，变量名之前需要加上$:
result=$(( no1 + 50 ))

# expr同样可以用于基本算术操作: result=`expr 3 + 4`
result=$(expr $no1 + 5)
# 以上这些方法只能用于整数运算，而不支持浮点数。

# bc是一个用于数学运算的高级工具，这个精密计算器包含了大量的选项。我们可以 借助它执行浮点数运算并应用一些高级函数
echo "4 * 0.56" | bc
2.24
no=54;
result=`echo "$no * 1.5" | bc`
echo $result
81.0

# 设定小数精度。在下面的例子中，参数scale=2将小数位个数设置为2。因此， bc将会输出包含两个小数位的数值。
echo "scale=2;3/8" | bc
0.37

# 进制转换。用bc可以将一种进制系统转换为另一种。来看看如何将十进制转换成 二进制，然后再将二进制转换回十进制:
no=100
echo "obase=2;$no" | bc
1100100
no=1100100
echo "obase=10;ibase=2;$no" | bc
100


# 计算平方以及平方根。
echo "sqrt(100)" | bc #Square root
echo "10^10" | bc #Square


