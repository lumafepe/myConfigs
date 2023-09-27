#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/ides.rasi"

# Links
JAVA="IJ"
PHP="PHP"
VS="Code"
PY="Py"
WS="WS"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$JAVA\n$PHP\n$VS\n$PY\n$WS"

chosen="$(echo -e "$options" | $rofi_command -p "IDES" -dmenu -selected-row 0)"
case $chosen in
    $JAVA)
		if [[ -f /usr/bin/idea ]]; then
			idea  &
		else
			msg "No suitable intellij-idea found!"
		fi
        ;;
    $PHP)
		if [[ -f /usr/bin/phpstorm ]]; then
			phpstorm &
		else
			msg "No suitable phpstorm found!"
		fi
        ;;
    $PY)
		if [[ -f /usr/bin/pycharm ]]; then
			pycharm &
		else
			msg "No suitable pycharm found!"
		fi
        ;;

	$WS)
		if [[ -f /usr/bin/webstorm ]]; then
			webstorm &
		else
			msg "No suitable webstorm found!"
		fi
        ;;
	$VS)
		if [[ -f /var/lib/snapd/snap/bin/code ]]; then
			code &
		else
			msg "No suitable VScode found!"
		fi
        ;;
esac
