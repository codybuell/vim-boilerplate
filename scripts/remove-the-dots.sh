#!/bin/bash
#
# Remove The Dots
#
# Script to remove symlinks for vim configuration files into your home directory.
#
# Author(s): Cody Buell
#
# Revisions: 2016.08.24 Initial framework.

FILES=(vimrc vim)
CONFGDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &&  cd ../ && pwd )"

prettyprint() {
  printf "$1" | awk '{file=$1;$1="";printf "  %-30s %s\n", file, $0}' | sed "s/ /,/g;s/\([^,]\),/\1 /g;s/,\([^,]\)/ \1/g;s/^,/ /;s/,/./g";
}

# iterate through the dotfiles
for i in ${FILES[@]}; do

  cd; HOME=`pwd`
  BACKUP=$(echo $HOME/`ls -1atr $HOME | grep ".$i.orig.*" | tail -1`)

  if [ -e "$BACKUP" ]; then
    prettyprint "  .${i} \033[0;32mreplacing original dotfile\033[0m\n"
    rm -rf $HOME/.$i
    mv $BACKUP $HOME/.$i
  else
    prettyprint "  .${i} \033[0;32mno original dotfile found\033[0m\n"
  fi

done
