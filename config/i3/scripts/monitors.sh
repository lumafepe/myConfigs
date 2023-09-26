#!/bin/bash
echo $(xrandr --listmonitors | grep "$1:" | tr " " "\n"| tail -n1)