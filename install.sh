#!/usr/bin/env bash

set -e

echo "Creating symbolic links"
for file in bash_profile gemrc gitconfig gitmessage railsrc vim vimrc ; do
  target=$HOME/.$file
  if [ -e $target ] ; then
    read -p "This will overwrite $target. Are you sure? (y/n) " -n 1;
    [[ $REPLY =~ ^[Yy]$ ]] && ln -sfv $PWD/$file $target
  else
    ln -sfv $PWD/$file $target
  fi
done

echo "Installing bash-git-prompt"
git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/bash-git-prompt

source $HOME/.profile

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "Installing vim plugins"
vim +PlugInstall +qall
