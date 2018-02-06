#  运行带有-x标志的脚本可以打印出所执行的每一行命令以及当前状态。注意，你也 可以使用sh -x script。
bash -x script.sh
sh -x script


使用set -x和set +x对脚本进行部分调试。例如:
#!/bin/bash #文件名: debug.sh
for i in {1..6}; do
    set -x
    echo $i
    set +x  
done
echo "Script executed"


# 通过传递 _DEBUG环境 变量来建立这类调试风格

#!/bin/bash
function DEBUG()
{
    [ "$_DEBUG" == "on" ] && $@ || :
}
for i in {1..10}
do
    DEBUG echo $i
done


# 可以将调试功能置为"on"来运行上面的脚本:
# $ _DEBUG=on ./script.sh

 set –x:在执行时显示参数和命令。
 set +x:禁止调试。
 set –v:当命令进行读取时显示输入。
 set +v:禁止打印输入。

shebang的妙用
把shebang从#!/bin/bash改成 #!/bin/bash -xv，这样一来，不用任何其他选项就可以
启用调试功能了。