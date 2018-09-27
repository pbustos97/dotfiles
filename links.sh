#!/bin/bash
############
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############

#### Variables

dir=~/dotfiles	# dotfiles directory
i3dir=~/dotfiles/i3 #i3 directory
files="/.config/i3/config /.i3/i3blocks.conf"	# list of files/folders to symlink in homedir
####

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# copy config files into folder
for file in $files; do
	echo "Copying any existing i3 files from ~ to $i3dir"
	cp ~/.$file ~/dotfiles/i3/
done
echo "Copying vimrc to $dir"
cp ~/.vimrc ~/dotfiles/vimrc
echo "Copying .Xdefaults to $dir"
cp ~/.Xdefaults ~/dotfiles/Xdefaults
echo "Copying ranger settings to $dir"
cp ~/.config/ranger/rc.conf ~/dotfiles/rc.conf

