#!/bin/zsh

#install oh-my-zsh
cd $HOME
git clone https://github.com/imLew/oh-my-zsh.git 
cd $HOME.oh-my-zsh
git pull origin:running running

#install vim plugins
echo "Downloading plugins for vim\n"
cd $HOME/.vim/pack/plugins/opt/
git clone https://github.com/Konfekt/FastFold.git
git clone https://github.com/tmhedberg/SimpylFold.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/git@github.com:tpope/vim-fugitive.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/sheerun/vim-polyglot.git
git clone https://github.com/zhimsel/vim-stay.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/christoomey/vim-tmux-navigator.git
