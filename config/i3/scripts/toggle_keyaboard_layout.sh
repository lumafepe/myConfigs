#!/bin/bash

current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$current_layout" == "pt" ]; then
	setxkbmap -model pc105 -layout us
	echo "Switched to US International keyboard layout."
else
	setxkbmap -model pc105 -layout pt
	echo "Switched to PT (Portuguese) keyboard layout."
fi
                
