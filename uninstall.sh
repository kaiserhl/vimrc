#!/usr/bin/env sh

INSTALLDIR=${INSTALLDIR:-"$PWD"}
echo $INSTALLDIR

which git > /dev/null || (echo "Need git installed" && exit 1)
which vim > /dev/null || (echo "Need vim installed" && exit 1)

if [ `pwd`/vimrc = `readlink ~/.vimrc` ]; then
  echo "Removing .vimrc"
  rm ~/.vimrc
fi

if [ `pwd` = `readlink ~/.vim` ]; then
  echo "Removing .vim"
  rm ~/.vim
fi
