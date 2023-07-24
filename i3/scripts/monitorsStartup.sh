#!/bin/bash
$firstMonitor=$(sh /home/luismfp/.config/i3/scripts/monitors.sh 0)
$secondMonitor=$(sh /home/luismfp/.config/i3/scripts/monitors.sh 1)
dr --output $firstMonitor --auto --left-of $secondMonitor --auto
