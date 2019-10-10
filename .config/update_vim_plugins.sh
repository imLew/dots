#!/bin/zsh

#update by git pull
echo "updating vim plugins from github\n"
for dir in $HOME/.vim/pack/plugins/opt/*
do
    cd $dir
    git pull
done
