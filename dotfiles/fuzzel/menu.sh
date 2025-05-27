#!/bin/sh

choice=$(fuzzel --dmenu < ~/.config/fuzzel/launch-list)

case "$choice" in
    "qutebrowser") exec qutebrowser ;;
    "wireplumber") exec wireplumber ;;
    "wireplumber kill") exec pkill wireplumber ;;
    "librewolf") exec librewolf ;;
    "chromium") exec chromium ;;
    "ranger") exec foot -e ranger ;;
    "icedove") exec icedove ;;
    "prismlauncher") exec flatpak run org.prismlauncher.PrismLauncher ;;
    "telegram") exec flatpak run org.telegram.desktop ;;
    "telegram kill") exec flatpak kill org.telegram.desktop ;;
    "discord") exec flatpak run com.discordapp.Discord ;;
    "discord kill") exec flatpak kill com.discordapp.Discord ;;
    "freecad") exec flatpak run org.freecad.FreeCAD ;;
    "steam") exec flatpak run com.valvesoftware.Steam ;;
    "steam kill") exec flatpak kill com.valvesoftware.Steam ;;
    "libreoffice") exec flatpak run org.libreoffice.LibreOffice ;;
    "obs studio") exec flatpak run com.obsproject.Studio ;;
    "zen") exec flatpak run app.zen_browser.zen ;;
    "vencord") exec flatpak run dev.vencord.Vesktop ;;
    "vencord kill") exec flatpak kill dev.vencord.Vesktop ;;
    "inkscape") exec flatpak run org.inkscape.Inkscape ;;
    "brightness MAX") exec lxqt-sudo brightnessctl set 15 ;;
    "brightness MIN") exec lxqt-sudo brightnessctl set 0 ;;
    "reboot") exec lxqt-sudo reboot ;;
    "shutdown") exec lxqt-sudo shutdown ;;
    "poweroff") exec lxqt-sudo shutdown ;;
    "air conditioner ON") exec sh -c 'ac-on.sh && fyi -t 2000 "mqtt" "AC powered ON"' ;;
    "air conditioner OFF") exec sh -c 'ac-off.sh && fyi -t 2000 "mqtt" "AC powered OFF"' ;;
    "color pick") color=$(grim -g "$(slurp -b 00000000 -p)" -t ppm - 2>/tmp/grim.err | convert - -format '%[pixel:p{0,0}]' txt:- 2>/tmp/convert.err | tail -n 1 | cut -d ' ' -f 4) && { echo "$color" | wl-copy; fyi -t 3000 "Picked" "$color"; } || fyi "Error" "Failed to pick color" ;;
    "emacs") exec foot -e emacsclient -nw ;;
    *) exit 1 ;;
esac
