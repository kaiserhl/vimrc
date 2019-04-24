
git clone https://github.com/vim/vim.git

yum install ncurses-devel

apt install build-essential
apt-get install libncurses5-dev libncursesw5-dev

./configure --enable-python3interp=yes --with-python3-command=/usr/bin/python3
