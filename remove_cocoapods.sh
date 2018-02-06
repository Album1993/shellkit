
#!/bin/zsh

sudo gem uninstall cocoapods

IFS=$'\n'
for i in  `gem list --local | grep -o "cocoapods-[a-z]*"`
do
  sudo gem uninstall $i
done
