#!/bin/bash

#prepare screenshots directory from scripts
mkdir -p "$HOME/images/screenshots/"

function get_next_filename_nu {
    if [ "$2" -gt 150 ]; then
        echo "error too much recursion file No. (${2})"
        exit 1
    fi

    posible_filename="${1}($2)"
    _=$(ls "$HOME/images/screenshots" -a | grep "$posible_filename")
    if [ $? -ne 0 ]; then
    #filename does not exists
        echo "$posible_filename"
    else
        echo "$(get_next_filename_nu $1 $(expr "$2" + "1"))"
    fi
}

function get_next_filename {
    _=$(ls "$HOME/images/screenshots/" -a | grep "$1")
    if [ $? -ne 0 ]; then
    #filename does not exists
        echo "$1"
        return
    fi


    echo "$(get_next_filename_nu $1 1)"
}


fullopt="fullscreen screenshot"
partopt="part screenshot"
windowopt="windows screenshot"

#select option
opt=$(echo -e "$fullopt\n$partopt\n$windowopt" | wofi -d)

if [ $? -ne 0 ]; then
    echo "no opts selected" >&2
    exit 1
fi

today=$(date +'%D' | sed s#/#_#g)
temp_last_screenshot="/tmp/${today}_soworksl_last_screenshot.png"

case "$opt" in

    "$fullopt")
        sleep 1 #wait for the dmenu disapears
        grim "$temp_last_screenshot"
        ;;

    "$partopt")
        part=$(slurp)
        grim -g "$part" "$temp_last_screenshot"
        ;;

    "$windowopt")
        echo "window screenshot not implemented yet" >&2
        exit 1
        ;;
    
    *)
        echo error >&2
        exit 1
        ;;
esac

if [ $? -ne 0 ]; then
    echo "fail in the screenshot" >&2
    exit 1
fi

saveopt="save in images"
copyopt="copy to the clipboard"
sandcopt="save and copy to the clipboard"

opt=$(echo -e "$saveopt\n$copyopt\n$sandcopt" | wofi -d)

if [ $? -ne 0 ]; then
    echo "no opts selected" >&2
    exit 1
fi
 
case "$opt" in

    "$saveopt")
        mv "$temp_last_screenshot" "$HOME/images/screenshots/$(get_next_filename "${today}_img").png"
        echo "image saved"
        ;;

    "$copyopt")
        wl-copy < "$temp_last_screenshot"
        echo "image copied"
        ;;

    "$sandcopt")
        moved_img="$HOME/images/screenshots/$(get_next_filename "${today}_img").png"
        mv "$temp_last_screenshot" "$moved_img"
        wl-copy < "$moved_img"
        echo image copied and saved
        ;;

    *)
        echo "error" >&2
        exit 1
        ;;

esac
