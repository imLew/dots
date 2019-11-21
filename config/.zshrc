export PATH="$PATH:/usr/local/bin:/opt/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX="true"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# Themes to be blacklisted, the ones above the blank line use the rvm-prompt
# package, the ones below just arent good
ZSH_BLACKLISTED_THEMES=(
3den, 
avit.zsh-theme, #this one cannot display half the output from ls
macovsky-ruby,
norm,

rixius,
miloshadzic,
cloud,
fox,
rixius,
kiwi,
awesomepanda,
agnoster,
gozilla,
dieter,
rixius,
fine-time)
ZSH_THEME="dst"

#after OMZ setup is complete source it
source $ZSH/oh-my-zsh.sh

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy/mm/dd"

plugins=(
git battery
git
# compleat
)
# acoording to SE these lines will fix the deprecation warning for the
# git-completion
autoload compinit -u

export EDITOR='vim'

alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias tmuxconfig="vim ~/.tmux.conf"
if [ -x "$(command -v systemctl)" ]; then
    function suspend(){
	    	echo "Will suspend in $1"; sleep $1; systemctl suspend
	}
fi
if [ -e /opt/nvim.appimage ]; then
    alias nvim="/opt/nvim.appimage"
fi
if [ -x "$(command -v nvim)" ]; then
    alias n="nvim"
    alias zshconfig="nvim ~/.zshrc"
    alias vimconfig="nvim ~/.vimrc"
    alias tmuxconfig="nvim ~/.tmux.conf"
    export EDITOR='nvim'
fi

# turn on vi mode
bindkey -v
export KEYTIMEOUT=1
autoload -Uz history-search-end

# better searching in vi mode
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -M vicmd '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end
bindkey -M viins '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end

# visual bell after command for tmux
precmd () {
      echo -n -e "\a"
}

# edit vim commands in vim?
autoload -U edit-command-line
zle -N edit-command-line 
bindkey -M vicmd V edit-command-line

# set locales cause this mac thinks there is german english
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8

# add conda completion to fpath
fpath+=$HOME/.oh-my-zsh/conda-zsh-completion
zstyle ':completion::complete:*' use-cache 1
zstyle ":conda_zsh_completion:*" use-groups true
compinit conda

if [ -f "$HOME/.config/conda_setup" ]; then
    source "$HOME/.config/conda_setup"
fi
