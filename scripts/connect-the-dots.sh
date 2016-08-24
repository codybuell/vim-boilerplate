#!/bin/bash
#
# Connect The Dots
#
# Script to place symlinks for vim configuration files into your home directory.
#
# Author(s): Cody Buell
#
# Revisions: 2016.08.24 Initial framework.

FILES=(vimrc vim)
CONFIGDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &&  cd ../ && pwd )"

prettyprint() {
  printf "$1" | awk '{file=$1;$1="";printf "  %-30s %s\n", file, $0}' | sed "s/ /,/g;s/\([^,]\),/\1 /g;s/,\([^,]\)/ \1/g;s/^,/ /;s/,/./g";
}

# iterate through the dotfiles
for i in ${FILES[@]}; do

  cd; HOME=`pwd`
  DATE=`date +%Y%m%d%H%M%S`

  # if the target already exists back it up
  if [ -f $HOME/.$i ] || [ -d $HOME/.$i ]; then
    if [ -L $HOME/.$i ]; then
      TARGET=`readlink $HOME/.$i`
      if [ $TARGET == $CONFIGDIR/$i ]; then
        prettyprint "  .${i} \033[0;32malready there\033[0m\n"
        continue
      else
        prettyprint "  .${i} \033[0;32mplacing dotfile\033[0m (\033[0;33moriginal symlink moved to ~/.$i.orig.$DATE\033[0m)\n"
      fi
    else
      prettyprint "  .${i} \033[0;32mplacing dotfile\033[0m (\033[0;33moriginal file moved to ~/.$i.orig.$DATE\033[0m)\n"
    fi
    mv $HOME/.$i $HOME/.$i.orig.$DATE
    touch $HOME/.$i.orig.$DATE
  else
    prettyprint "  .${i} \033[0;32mplacing dotfile\033[0m\n"
  fi

  ln -s $CONFIGDIR/$i $HOME/.$i

done
