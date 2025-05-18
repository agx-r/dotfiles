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
    "discord") exec flatpak run com.discordapp.Discord ;;
    "freecad") exec flatpak run org.freecad.FreeCAD ;;
    "libreoffice") exec flatpak run org.libreoffice.LibreOffice ;;
    "inkscape") exec flatpak run org.inkscape.Inkscape ;;
    "air conditioner ON") exec sh -c 'ac-on.sh && fyi -t 2000 "mqtt" "AC powered ON"' ;;
    "air conditioner OFF") exec sh -c 'ac-off.sh && fyi -t 2000 "mqtt" "AC powered OFF"' ;;
    "emacs") exec foot -e emacsclient -nw ;;
    *) exit 1 ;;
esac
