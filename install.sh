#!/bin/sh
path=$(pwd)

ln -sf $path/.config/* ~/.config
ln -sf $path/.xinitrc ~
ln -sf $path/.vimrc ~
cp $path/.Xresources ~
