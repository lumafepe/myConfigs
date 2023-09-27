#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/battery.rasi"

## Get data
BATTERY="$(acpi | awk -F ' ' '{print $4}' | tr -d \%,)"
CHARGE="$(acpi | awk -F ' ' '{print $3}' | tr -d \,)"
CM="$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)"
active=""
urgent=""
if [[ $CM = 0 ]]; then
	ICON_CM="🗲"
elif [[ $CM = 1 ]]; then
    ICON_CM="🔋"
fi

if [[ $CHARGE = *"Charging"* ]]; then
    active="-a 1"
    ICON_CHRG=""
    MSG=$CHARGE
elif [[ $CHARGE = *"Full"* ]]; then
    active="-u 1"
    ICON_CHRG=""
    MSG=$CHARGE
else
    urgent="-u 1"
    ICON_CHRG=""
    MSG=$CHARGE
fi

# Discharging
#if [[ $CHARGE -eq 1 ]] && [[ $BATTERY -eq 100 ]]; then
#    ICON_DISCHRG=""
if [[ $BATTERY -ge 5 ]] && [[ $BATTERY -le 19 ]]; then
    ICON_CHRG=""
elif [[ $BATTERY -ge 20 ]] && [[ $BATTERY -le 39 ]]; then
    ICON_CHRG=""
elif [[ $BATTERY -ge 40 ]] && [[ $BATTERY -le 59 ]]; then
    ICON_CHRG=""
elif [[ $BATTERY -ge 60 ]] && [[ $BATTERY -le 79 ]]; then
    ICON_CHRG=""
elif [[ $BATTERY -ge 80 ]] && [[ $BATTERY -le 100 ]]; then
    ICON_CHRG=""
fi

## Icons
ICON_PMGR=""

options="$ICON_CHRG\n$ICON_PMGR\n$ICON_CM"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$MSG : $BATTERY%" -dmenu $active $urgent -selected-row 0)"
case $chosen in
    $ICON_CHRG)
        ;;
    $ICON_PMGR)
        xfce4-power-manager-settings
        ;;
	$ICON_CM)
		if [[ $CM = 0 ]]; then
			echo 1 >/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
		elif [[ $CM = 1 ]]; then
			echo 0 >/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
		fi
		;;
esac

