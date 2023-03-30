#!/bin/sh
PARENT_BAR="bottom"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)
# Sends $2 as message to all polybar PIDs that are part of $1
update_hooks() {
    while IFS= read -r id
    do
        polybar-msg -p "$id" hook notifications-control $2 1>/dev/null 2>&1
    done < <(echo "$1")
}
dunstctl set-paused toggle
update_hooks "$PARENT_BAR_PID" 2