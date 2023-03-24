#!/bin/sh
while read line
do
    SINKNUMBER=$(echo "$line" | awk -F "Sink #" '{print $2}' | cut -d% -f1)
    if [ $(pactl list short sinks | grep "$SINKNUMBER" | grep "pci-0000" | wc -c) -eq 0 ]
    then
        if [ $(pactl list short sinks | grep "$SINKNUMBER" | grep "bluez_output" | wc -c) -eq 0 ]
        then
            echo "${line%%S*}󰋋"
        else
            echo "${line%%S*}󰥰"
        fi
    else
        echo "${line%%S*}"        
    fi
done < /dev/stdin