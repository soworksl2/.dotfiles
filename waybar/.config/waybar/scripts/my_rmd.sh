#!/bin/bash

E1="2028-7-29"
E2="2031-7-29"
E3="2035-7-29"
E4="2040-7-29"

now_secs="$(date +%s)"


function rmddays() {
    local date_s="$(date -d "$1" +%s)"

    remainder=$(( $date_s - $now_secs ))
    remainder_d=$(( $remainder / 86400 )) #convert seconds to days

    echo "$remainder_d"
}


if [ "$now_secs" -lt "$(date -d $E1 +%s)" ]; then
    echo "E1: $(rmddays $E1)d"
elif [ "$now_secs" -lt "$(date -d $E2 +%s)" ]; then
    echo "E2: $(rmddays $E2)d"
elif [ "$now_secs" -lt "$(date -d $E3 +%s)" ]; then
    echo "E3: $(rmddays $E3)d"
else
    echo "E4: $(rmddays $E4)d"
fi
