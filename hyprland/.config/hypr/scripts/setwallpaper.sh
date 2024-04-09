#!/bin/bash

#right now the wallpaper is set at the begining randomly and it cannot
#change then. if this script is executed twice the second wallpaper will be over the first one consuming resources

function hyprwarn {
    hyprctl notify 0 $1 "rgb(ffffff)" "fontsize:14 $2"
}

function randran {
    echo $(($RANDOM%($2-$1+1)+$1))
}


#require swaybg
if [ ! $(command -v swaybg) ]; then
    hyprwarn 30000 "swaybg is not installed"
    exit 1
fi

wallpapers_dir="$HOME/images/wallpapers"

if [ ! -d "$wallpapers_dir" ]; then
    hyprwarn 10000 "wallpaper dir does not exists" 
    exit 1
fi


all_wallpapers=( $(ls "$HOME/images/wallpapers/") )
wallpapers_count=${#all_wallpapers[@]}

rand_selection=$(($(randran 0 $wallpapers_count)-1))
swaybg -m fill -i "${wallpapers_dir}/${all_wallpapers[$rand_selection]}"
