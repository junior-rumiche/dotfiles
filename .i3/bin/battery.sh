#!/bin/bash

status=`cat /sys/class/power_supply/BAT0/status | tr '[[:lower:]]' '[[:upper:]]'`
porcentaje=`acpi | awk '{print $4}' | sed -e s/%,//g`
icon=""
alarm=0
aux=1

function sound(){
    notify-send -i ~/Escritorio/i3/image/low-battery-level.png  -t 1000 "BATTERY LOW, RECHARGE"
    play "~/Escritorio/i3/sounds/battery.mp3" &> /dev/null
}

if [[ $porcentaje -le 20 ]]; then
    icon="🌕"
    alarm=1
    if [[ $alarm -eq 1 && $aux -eq 1 ]]; then
        sound
        aux=0

    fi
elif [[ $porcentaje -le 40 ]]; then
    aux=1
    icon="🌔"
elif [[ $porcentaje -le 65 ]]; then
    icon="🌓"
elif [[ $porcentaje -le 99 ]]; then
    
    icon="🌒"
elif [[ $porcentaje -eq 100 ]]; then
    icon="🌑"
fi

echo " ${icon} ${status} ${porcentaje}% "
