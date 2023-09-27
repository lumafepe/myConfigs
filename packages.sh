#!/bin/bash

comm -23 <(pacman -Qtq) <(pacman -Qsq base base-devel) | xargs -I {} bash -c 'if yay -Ss --color never {} | grep -q "aur/"; then echo "{}"; fi' > packages.txt
