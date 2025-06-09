#!/bin/sh

msg() {
    fyi "Sway init" "$1"
}

exec swaybg -i "$HOME/.config/sway/wallpapers.png" -m fill &
msg "Swaybg started"

exec mako &
msg "Mako started"

exec waybar &
msg "Waybar started"

exec record-buffer.sh & 
msg "Recording started"

exec pipewire &
msg "Pipewire started"

exec wireplumber &
msg "Wireplumber started"

#exec fyi -t 5000 "Starting emacs daemon" &
#exec emacs --daemon
