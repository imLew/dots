DOTS="$(pwd)"

function link_dotfile(){
  HOMEFILE="$HOME/.$(basename $1)"
  DOTFILE=$1
	if [ -e $HOMEFILE ]; then
		mv $HOMEFILE "$HOMEFILE.bkp"
		echo "Moved existing $HOMEFILE to $HOMEFILE.bkp."
	fi
	ln -s $DOTFILE $HOMEFILE
}

for file in "$DOTS/config/dotfiles"/*; do
	link_dotfile $file
done

# if [ -d "$HOME/.config" ]; then
# 	if [ -e "$DOTS/config/nvim"  ]; then
#     mv "$DOTS/config/nvim" "$BACKUP_DOTS/nvim.bkp" 
#   fi
#   ln -s "$DOTS/config/nvim" "$HOME/.config/nvim"
# fi
# 
# sh $DOTS/downloads_for_dots.sh
