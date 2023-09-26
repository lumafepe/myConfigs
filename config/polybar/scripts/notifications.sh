#!/bin/sh
if [ $(dunstctl is-paused | wc -c) -eq 6 ]
then
    echo " "
else
    echo " "
fi