#!/bin/bash

# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="top"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

# Format of the information displayed
# Eg. {{ artist }} - {{ album }} - {{ title }}
# See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata

# Sends $2 as message to all polybar PIDs that are part of $1
update_hooks() {
    while IFS= read -r id
    do
        polybar-msg -p "$id" hook myTitle $2 1>/dev/null 2>&1
    done < <(echo "$1")
}

XTITLESTATUS=$(xtitle 2> /dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$XTITLESTATUS
else
    STATUS="ERROR"
fi

if [ "$1" == "--status" ]; then
    echo "$STATUS"
else
    if [ "$STATUS" = "" ]; then
        echo "ARCH LINUX"
    else
        update_hooks "$PARENT_BAR_PID" 1
        echo "$STATUS"
    fi
fi
