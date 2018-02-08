script -t 2> timing.log -a output.session
type commands;
    ...
    ..
exit

两个配置文件被当做script命令的参数。其中一个文件(timing.log)用于存储时序信息， 描述每一个命令在何时运行;另一个文件(output.session)用于存储命令输出。-t选项用于将时 序数据导入stderr。2>则用于将stderr重定向到timing.log。
利用这两个文件:timing.log(存储时序信息)和output.session(存储命令输出信息)，我们 可以按照下面的方法回放命令执行过程:
$ scriptreplay timing.log output.session