#!/usr/bin/env sh

INSTALLDIR=${INSTALLDIR:-"$PWD/vimrc"}
echo $INSTALLDIR

which git > /dev/null || (echo "Need git installed" && exit 1)
which vim > /dev/null || (echo "Need vim installed" && exit 1)

cd $INSTALLDIR
[ ! -f ~/.vim ] && ln -vsfn $INSTALLDIR ~/.vim
[ ! -f ~/.vimrc ] && ln -vsfn $INSTALLDIR/vimrc ~/.vimrc

if [ ! -d "bundle" ]; then
    echo "Creating bundle directory ..."
    mkdir bundle
fi

if [ ! -d "bundle/vundle" ]; then
    echo "Installing Vundle (https://github.com/gmarik/vundle) ..."
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi

vim +BundleInstall +qall 
