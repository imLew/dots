#!/bin/sh
DOTS="$(pwd)"

#install oh-my-zsh
cd $HOME
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# zsh plugins
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# if [ -d "$HOME/.oh-my-zsh" ]; then
# 	cd $HOME/.oh-my-zsh
# 	git remote add myfork https://github.com/imLew/oh-my-zsh.git 
# 	git pull myfork running:running
# 	git checkout running
# 	git merge master
# fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# download plugins found in vimrc
# /usr/bin/python "$DOTS/install_vim_plugins.py"
