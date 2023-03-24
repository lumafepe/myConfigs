#!/bin/bash

zscroll -l 30 \
        --delay 0.1 \
        --update-check true "`dirname $0`/get_title.sh" &
wait
