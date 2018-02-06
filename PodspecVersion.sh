#!/bin/zsh

if [ "`ls *.podspec`" = "" ]; then
  DIRECTORY="`ls *.podspec`"
  echo "$DIRECTORY is indeed empty"
else
  DIRECTORY="`ls *.podspec`"
  echo "$DIRECTORY is not empty"

#切换到主分支
  if [ "`git symbolic-ref --short -q HEAD`" = "master" ]; then
    echo "is master"
  else
    echo "isnt master"
    git checkout master
    echo "checkout to master"
  fi

  podversionstring="`grep "s.version\s*=\s*'[0-9]*.[0-9]*.[0-9]*'" *.podspec > spec.tmp`"
  oldversion="`grep -o "'[0-9]*.[0-9]*.[0-9]*'" spec.tmp`"
  echo "old version is $oldversion"
  echo "please add new version"
  read newVersion
  echo "$newVersion is new version"
  rm "spec.tmp"
  sed -i "" "s/$oldversion/'$newVersion'/g" $DIRECTORY
  git add $DIRECTORY
  git commit -m "change podspec version to $newVersion"
  git push origin

  git checkout -b $newVersion
  git push origin $newVersion
  git tag $newVersion
  git push --tags
  git checkout master

fi