DOTS="$(pwd)"

function link_config_dir(){
  HOMECONFIGDIR="$HOME/.config/$(basename $1)"
  DIRNAME=$1
	if [ -e $HOMECONFIGDIR ]; then
		mv $HOMECONFIGDIR "$HOMECONFIGDIR.bkp"
		echo "Moved existing $HOMECONFIGDIR  to $HOMECONFIGDIR.bkp."
	fi
  echo "linking $DIRNAME to $HOMECONFIGDIR"
	ln -s $DIRNAME $HOMECONFIGDIR 
}

function link_dotfile(){
  HOMEFILE="$HOME/.$(basename $1)"
  DOTFILE=$1
	if [ -e $HOMEFILE ]; then
		mv $HOMEFILE "$HOMEFILE.bkp"
		echo "Moved existing $HOMEFILE to $HOMEFILE.bkp."
	fi
	ln -s $DOTFILE $HOMEFILE
}

for file in "$DOTS/config/dotconfig"/*; do
	link_config_dir $file
done

for file in "$DOTS/config/dotfiles"/*; do
	link_dotfile $file
done

for file in "$DOTS/scripts"/*; do
  ln -s $file "/opt/bin/$(basename $file)"
done
# if [ -d "$HOME/.config" ]; then
# 	if [ -e "$DOTS/config/nvim"  ]; then
#     mv "$DOTS/config/nvim" "$BACKUP_DOTS/nvim.bkp" 
#   fi
#   ln -s "$DOTS/config/nvim" "$HOME/.config/nvim"
# fi
# 
# sh $DOTS/downloads_for_dots.sh
