repeat() {
while true do
        $@ && return
      done
}

# 或者把它放入shell的rc文件，更便于使用:
repeat() { while true; do $@ && return; done }

# 我们创建了函数repeat，它包含了一个无限while循环，该循环执行以参数形式(通过$@
# 访问)传入函数的命令。如果命令执行成功，则返回，进而退出循环。

# 1. 一种更快的做法
#  在大多数现代系统中，true是作为/bin中的一个二进制文件来实现的。这就意味着每执行一 次while循环，
#  shell就不得不生成一个进程。如果不想这样，可以使用shell内建的“:”命令， 它总是会返回为0的退出码:
repeat() { while :; do $@ && return; done }


# 2. 增加延时 假设你要用repeat()从Internet上下载一个暂时不可用的文件，不过这个文件只需要等一会
# 就能下载。方法如下:
    repeat wget -c http://www.example.com/software-0.1.tar.gz
#  如果采用这种形式，需要向www.example.com发送很多数据，有可能会对服务器产生影响。 (甚至也会给你造成麻烦，如果服务器认为你是在发送垃圾信息，就可能把你列入黑名单。)要解
#  决这个问题，我们可以修改函数，加入一段短暂的延时:
    repeat() { while :; do $@ && return; sleep 30; done }
# 这使得命令每30秒运行一次。