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
if ! command -v swaybg &> /dev/null; then
    hyprwarn 30000 "swaybg is not installed"
    exit 1
fi

wallpapers_dir="$HOME/images/wallpapers"

if [ ! -d "$wallpapers_dir" ]; then
    hyprwarn 10000 "wallpaper dir does not exists" 
    exit 1
fi

#close the last swaybg if it is already running
swaybg_pid_temp="$(ps -C swaybg)"
is_swaybg_active="$?"
if test "${is_swaybg_active}" -eq 0; then
    kill "$(awk 'NR==2 {print $1}' <<< "${swaybg_pid_temp}")" &> /dev/null
fi


all_wallpapers=( $(ls "$HOME/images/wallpapers/") )
wallpapers_count=${#all_wallpapers[@]}

if test "${wallpapers_count}" -le "0"; then
    hyprwarn 10000 "there are no wallpapers to set in the wallpapers directory"
    exit 1
fi

rand_selection=$(($(randran 0 $wallpapers_count)-1))
swaybg -m fill -i "${wallpapers_dir}/${all_wallpapers[$rand_selection]}" &> /dev/null &
