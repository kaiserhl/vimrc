#!/bin/bash

if [ ! -d ctags ]; then
  git clone https://github.com/universal-ctags/ctags.git
fi

pushd ctags
./autogen.sh
./configure
make
make install
popd

exit 0
