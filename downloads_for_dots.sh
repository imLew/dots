#!/bin/sh
DOTS="$(pwd)"

#install oh-my-zsh
cd $HOME
git clone https://github.com/robbyrussell/oh-my-zsh.git
mv oh-my-zsh .oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
	cd $HOME/.oh-my-zsh
	git remote add myfork https://github.com/imLew/oh-my-zsh.git 
	git pull myfork running:running
	git checkout running
	git merge master
fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# download plugins found in vimrc
# /usr/bin/python "$DOTS/install_vim_plugins.py"
