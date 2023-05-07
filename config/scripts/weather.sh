#!/bin/sh

query=($(curl --no-progress-meter "wttr.in/Adelaide?format=%t+%c+%S+%s+%p" | sed -e "s/://g"))
time=$(date +%T | sed -e "s/://g")
raining=false

if [[ $time > ${query[2]} && $time < ${query[3]} ]]
then
    case ${query[1]} in
        ☀️) icon="󰖙";;
        🌩) icon="󰖓"
            raining=true;;
        🌦) icon="󰼳"
            raining=true;;
        ⛅️) icon="󰖕";;
        ☁️) icon="󰖐";;
        🌫) icon="󰖝";;
        🌧) icon="󰖖"
            raining=true;;
        ❄️) icon="󰖘";;
    esac
else
    case ${query[1]} in
        ☀️) icon="󰖔";;
        🌩) icon="󰖓"
            raining=true;;
        🌦) icon="󰖗"
            raining=true;;
        ⛅️) icon="󰼱";;
        ☁️) icon="󰖐";;
        🌫) icon="󰖝";;
        🌧) icon="󰖖"
            raining=true;;
        ❄️) icon="󰖘";;
    esac
fi

if $raining
then echo "${query[0]} $icon  ${query[4]}"
else echo "${query[0]} $icon"
fi
