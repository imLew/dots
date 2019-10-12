#!/bin/zsh

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

#install vim plugins
mkdir -p $HOME/.vim/pack/plugins/opt/
if [ -d "$HOME/.vim/pack/plugins/opt/" ]; then
	cd $HOME/.vim/pack/plugins/opt/
	echo "Downloading plugins for vim\n"

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
	    if [ ! -d "$rep" ]; then
		    git clone $rep
	    else
		    echo "$rep already exists, will pull instead of cloning"
		    cd $rep
		    git pull
		    cd ..
	    fi
	done
fi
