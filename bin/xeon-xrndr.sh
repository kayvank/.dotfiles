#!/bin/bash
##
xrandr  --auto

xrandr  --output DVI-I-1-1 \
    --mode 3440x1440  \
    --above eDP-1  \
    --rotate normal  \
    --right-of DVI-I-3-2

xrandr  --output DVI-I-3-2 \
    --mode 3840x2160  \
    --left-of DVI-I-2-1  \
    --rotate right 

xrandr --output eDP-1 --off  ## turn the laptop screen off 
