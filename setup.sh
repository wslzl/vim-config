#!\bin\bash

wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim --directory=./.vim/autoload

ln -s $(pwd)/.vimrc ~/
ln -s $(pwd)/.vim ~/
