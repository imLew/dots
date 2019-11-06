DOTS="$(pwd)"
BACKUP_DOTS="$HOME/BACKUP_DOTS"

function link_dotfile(){
  HOMEFILE="$HOME/$1"
  DOTFILE="$DOTS/config/$1"
	if [ -e $HOMEFILE ]; then
		mv $HOMEFILE "$BACKUP_DOTS/$HOMEFILE.bkp"
		echo "Moved existing $HOMEFILE to $BACKUP_DOTS/$HOMEFILE.bkp."
	fi
	ln -s $DOTFILE $HOMEFILE
}

link_dotfile .zshrc
link_dotfile .vimrc
link_dotfile .tmux.conf
link_dotfile .vim

if [ -d "$HOME/.config" ]; then
	if [ -e "$DOTS/config/nvim"  ]; then
    mv "$DOTS/config/nvim" "$BACKUP_DOTS/nvim.bkp" 
  fi
  ln -s "$DOTS/config/nvim" "$HOME/.config/nvim"
fi

sh $DOTS/downloads_for_dots.sh
