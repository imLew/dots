# if [ -f /etc/profile ]; then
#     PATH=""
#     source /etc/profile
# fi

# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/bin:/usr/local/bin



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
fine-time)
ZSH_THEME="half-life"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

source $ZSH/oh-my-zsh.sh

# source $HOME/.oh-my-zsh/git-completion.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

if [ -e /opt/nvim.appimage ]; then
    alias nvim="/opt/nvim.appimage"
fi
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias tmuxconfig="vim ~/.tmux.conf"


sd () {
    if [ $# -eq 0 ] # check if arguments were given
    then
        builtin cd
    else
        if [ ! -d "$1" ] #if directory doesn't exist create it
            then mkdir -p $1
        fi
        builtin cd $1
    fi
}

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

# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/nikolai/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/nikolai/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nikolai/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/nikolai/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
