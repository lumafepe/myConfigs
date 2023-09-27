#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/playerctl.rasi"

# Gets the current status of playerctl (for us to parse it later on)
status="$(playerctl status)"
# Defines the Play / Pause option content
if [[ $status == *"[Playing]"* ]]; then
    play_pause=""
else
    play_pause=""
fi
active=""
urgent=""

stop=""
next=""
previous=""

# Variable passed to rofi
options="$previous\n$play_pause\n$next\n

# Get the current playing song

current=$(playerctl metadata --format "{{ title }} - {{ artist }}")

# If playerctl isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the playerctl menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "  $current" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        playerctl prev
        ;;
    $play_pause)
		playerctl play-pause
		;;
    $stop)
		playerctl stop
        ;;
    $next)
		playerctl next
        ;;
    $tog_repeat)
		if [[ $loopmode == *"None"* ]]; then
			playerctl loop Playlist	
		else
			playerctl loop None
		fi
        ;;
    $tog_random)
		if [[ $randommode == *"On"* ]]; then
			playerctl shuffle On
		else
			playerctl  shuffle Off
		fi
        ;;
esac
