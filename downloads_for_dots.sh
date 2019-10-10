#!/bin/zsh

#install oh-my-zsh
cd $HOME
git clone https://github.com/imLew/oh-my-zsh.git 
cd $HOME/.oh-my-zsh
git pull origin running:running
git checkout running

#install vim plugins
echo "Downloading plugins for vim\n"
cd $HOME/.vim/pack/plugins/opt/

PLUGIN_REPOS=(
"https://github.com/Konfekt/FastFold.git"
"https://github.com/tmhedberg/SimpylFold.git"
"https://github.com/Valloric/YouCompleteMe.git"
"https://github.com/w0rp/ale.git"
"https://github.com/scrooloose/nerdtree.git"
"https://github.com/vim-airline/vim-airline"
"https://github.com/git@github.com:tpope/vim-fugitive.git"
"https://github.com/airblade/vim-gitgutter.git"
"https://github.com/sheerun/vim-polyglot.git"
"https://github.com/zhimsel/vim-stay.git"
"https://github.com/tpope/vim-surround.git"
"https://github.com/christoomey/vim-tmux-navigator.git"
"https://github.com/peitalin/vim-jsx-typescript.git"
"https://github.com/leafgarland/typescript-vim.git"
"https://github.com/dyng/ctrlsf.vim.git"
"https://github.com/ctrlpvim/ctrlp.vim.git"
)
for rep in "${PLUGIN_REPOS[@]}"; do
    git clone $rep
done
