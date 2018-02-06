#!/bin/zsh
cd
if [  -d "spacecommander" ]; then
  DIRECTORY="`pwd`"
else
  git clone https://github.com/square/spacecommander.git
  DIRECTORY="`pwd`"
fi
echo "$DIRECTORY"

# 初始化 grep -c 判断存在的行数
# 初始化 clang文件
if [ `grep -c "alias clangformatsetup=" $DIRECTORY/\.zshrc` -eq '1' ]; then
  echo "Found!"
else
     echo "alias clangformatsetup=\"$DIRECTORY/spacecommander/setup-repo.sh\"">> $DIRECTORY/\.zshrc
  echo "not found!"
fi

# 格式化对应文件
if [ `grep -c "alias clangformatfile=" $DIRECTORY/\.zshrc` -eq '1' ]; then
  echo "Found!"
else
  echo "alias clangformatfile=\"$DIRECTORY/spacecommander/format-objc-file.sh\"">> $DIRECTORY/\.zshrc
  echo "not found!"
fi

# 格式化所有暂存文件
if [ `grep -c "alias clangformatfiles=" $DIRECTORY/\.zshrc` -eq '1' ]; then
  echo "Found!"
else
  echo "alias clangformatfiles=\"$DIRECTORY/spacecommander/format-objc-files.sh\"">> $DIRECTORY/\.zshrc
  echo "not found!"
fi

# 格式化整个仓库
if [ `grep -c "alias clangformatall=" $DIRECTORY/\.zshrc` -eq '1' ]; then
  echo "Found!"
else
  echo "alias clangformatall=\"$DIRECTORY/spacecommander/format-objc-files-in-repo.sh\"">> $DIRECTORY/\.zshrc
  echo "not found!"
fi



# BasedOnStyle: Chromium
# IndentWidth: 4
# AlignConsecutiveAssignments: true
# AlignConsecutiveDeclarations: true
# ObjCSpaceAfterProperty: true
# PointerAlignment: Right
# BreakBeforeBraces: Attach
