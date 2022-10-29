#!/bin/sh

$HOME/.config/polybar/launch.sh
$HOME/.config/bspwm/locker &

/usr/bin/xinput set-prop 10 319 0
/usr/bin/xinput set-prop 10 330 -0.3
/usr/bin/xset r rate 300 45
/snap/bin/mailspring --background &

betterlockscreen -w
ibus-daemon --xim 
ibus restart
