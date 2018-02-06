
#!/bin/bash

sudo apt-get update 
sudo apt-get upgrade

# 卸载libreOffice
sudo apt-get remove libreoffice-common 

# 删除Amazon的链接
sudo apt-get remove unity-webapps-common 

# 删除不常用的软件
sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot 
sudo apt-get remove gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku  landscape-client-ui-install 

sudo apt-get remove onboard deja-dup 

# 主题美化篇
echo y | sudo apt-get install unity-webapps-common
echo y | sudo apt-get install unity-tweak-tool 


echo -e "\r" | sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
echo y | sudo apt-get install flatabulous-theme

echo -e "\r" | sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
echo y | sudo apt-get install ultra-flat-icons

echo -e "\r" | sudo add-apt-repository ppa:noobslab/macbuntu
sudo apt-get update
echo y | sudo apt-get install macbuntu-os-icons-lts-v7
echo y | sudo apt-get install macbuntu-os-ithemes-lts-v7

echo y | sudo apt-get install fonts-wqy-microhei


echo y | sudo apt-get install zsh
echo y | sudo apt-get install git
sudo chsh -s /bin/zsh
#-O - 会将数据写入stdout
echo y | sudo wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -  --user-agent="Mozilla/5.0 (X11;U;Linux i686;en-US;rv:1.9.0.3) Geco/2008092416 Firefox/3.0.3" --no-check-certificate | sudo sh
sudo sed 's/ZSH_THEME="[^\"]*"/ZSH_THEME="ys"/g' .zshrc -i

# 实用工具
# 工具推荐一: 系统负载指示器
echo y | sudo apt-get install -y indicator-multiload

# 工具推荐二: 经典菜单指示器
# 自动分类全部应用, 简直不要太爽

echo -e "\r" | sudo apt-add-repository ppa:diesch/testing
sudo apt-get update
echo y | sudo apt-get install classicmenu-indicator

echo y | sudo apt-get autoremove