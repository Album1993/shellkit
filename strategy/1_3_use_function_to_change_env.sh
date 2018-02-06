#!/bin/zsh

# 老式方法
# export PATH=/opt/myapp/bin:$PATH
# export LD_LIBRARY_PATH=/opt/myapp/lib;$LD_LIBRARY_PATH


# linux
# 使用函数
# prepend() { [ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1; }
# 没区别
# eval表达式将第一个参数所指定的变量值设置成第二个参数的值加上“:”(路径分隔 符)，随后再跟上首个参数的原始值。
prepend() { eval $1=\"$2':'\$$1\" && echo $1; eval echo \$$1}
prepend2() { eval $1="$2:\$$1" && echo $1; eval echo \$$1}

prepend PATH /opt/myapp/lib
prepend2 PATH /opt/myapp/lib

# 在进行添加时，如果变量为空，则会在末尾留下一个“:”。要解决 这个问题，可以将该函数再进行一些修改
# ${parameter:+expression}
# 如果有$1 就添加 ：$1  如果没有就不添加
prepend() { [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1 ; }

# prepend LD_LIBRARY_PATH /opt/myapp/lib
