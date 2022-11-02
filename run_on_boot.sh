#!/bin/sh

betterlockscreen -w
$HOME/.config/bspwm/locker &

/usr/bin/xset r rate 300 45
/snap/bin/mailspring --background &

ibus-daemon --xim 
ibus restart

# set brighness to 80%
brightnessctl s 75%
