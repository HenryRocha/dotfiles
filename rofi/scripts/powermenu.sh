#!/bin/zsh 

# Options
arr=()
arr+=("Shutdown")
arr+=("Reboot")
arr+=("Lock")
arr+=("Quit")
arr+=("Logout")

# Run Rofi with these options
chosen=$(printf '%s\n' "${arr[@]}" | rofi -dmenu -i -location 5 -width 8 -yoffset -27 -lines 5 -selected-row 3 -p System)

# Run the command based on the choice
if [ "$chosen" = "Shutdown" ]; then
    shutdown now
    exit 0
fi

if [ "$chosen" = "Reboot" ]; then
    reboot
    exit 0
fi

if [ "$chosen" = "Lock" ]; then
    xset s activate
    exit 0
fi

if [ "$chosen" = "Quit" ]; then
    bspc quit
    exit 0
fi

if [ "$chosen" = "Logout" ]; then
    bspc quit
    logout
    exit 0
fi
