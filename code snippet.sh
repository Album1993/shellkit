alias setproxy="export http_proxy=http://127.0.0.1:8899; export https_proxy=$http_proxy; echo 'HTTP Proxy on';"
alias unsetproxy="unset http_proxy; unset https_proxy; echo 'HTTP Proxy off';"

alias setcharlesproxy="export http_proxy=http://127.0.0.1:8888; export https_proxy=$http_proxy; echo 'HTTP Proxy on';"
alias unsetcharlesproxy="unset http_proxy; unset https_proxy; echo 'HTTP Proxy off';"


# 1.安装dmg文件
hdiutil attach jdk-9.0.1_osx-x64_bin.dmg
会挂载在 /Volumes 目录下

# 2.安装pkg文件（可以 man installer 查看命令的参数）

sudo installer -pkg JDK\ 9.0.1.pkg -target /

# 3.卸载

# 卸载镜像：
hdiutil detach /Volumes/JDK\ 9.0.1/
# 卸载JDK：
sudo rm -rf /Library/Java/JavaVirtualMachines
# APP的话一般安装在/Applications ：
cd /Applications
rm -rf Google Chrome.app


# charles 捕获 curl
curl -x 127.0.0.1:8888 https://www.sogou.com

# Connecting to github.com (github.com)|192.30.255.112|:443... connected.
# Unable to establish SSL connection.
有些网站不允许非浏览器方式获取文件，用加参数:
wget https://URL-TO-DOWNLOAD
--user-agent="Mozilla/5.0 (X11;U;Linux i686;en-US;rv:1.9.0.3) Geco/2008092416 Firefox/3.0.3"
--no-check-certificate
试试看

# git clone: GnuTLS recv error (-9): A TLS packet with unexpected length was received
# 删除现有的git，  再重新安装
# Remove current GIT from your system
#  sudo apt-get purge git
# Download GIT deb git_1.9.1-1_amd64.deb link
# Execute the downloaded DEB.









