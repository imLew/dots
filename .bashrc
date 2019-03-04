alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias la='ls -Alh --color'
alias ll='ls -lh --color'

alias pep8='py.test --codestyle -m codestyle'

#alias python to anaconda python
#alias python="$HOME/anaconda3/bin/python"
#alias conda="$HOME/anaconda3/bin/conda"
#alias activate="$HOME/anaconda3/bin/activate"

#color bash
export PS1="\[\033[38;5;28m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;58m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;178m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;46m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\\$\[$(tput sgr0)\]"
echo -e "\n DIT IS $PWD!!!"

# added by Anaconda3 installer

mkcd () {
	mkdir "$1"
	cd "$1"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/workingman/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/workingman/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/workingman/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/workingman/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
. /home/workingman/anaconda3/etc/profile.d/conda.sh
exec fish
