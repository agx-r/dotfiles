#!/bin/sh

choice=$(fuzzel --dmenu < ~/.config/fuzzel/launch-list)

case "$choice" in
    " qutebrowser") exec qutebrowser ;;
    " librewolf") exec librewolf ;;
    " chromium") exec chromium ;;
    "󱋿 wireplumber") exec wireplumber ;;
    "󱋿 wireplumber kill") exec pkill wireplumber ;;
    " icedove") exec icedove ;;
    " ranger") exec foot -e ranger ;;
    " emacs") exec foot -e emacsclient -nw ;;
    " telegram") exec flatpak run org.telegram.desktop ;;
    " telegram kill") exec flatpak kill org.telegram.desktop ;;
    " libreoffice") exec flatpak run org.libreoffice.LibreOffice ;;
    "󰕧 obs studio") exec flatpak run com.obsproject.Studio ;;
    " inkscape") exec flatpak run org.inkscape.Inkscape ;;
    " freecad") exec flatpak run org.freecad.FreeCAD ;;
    " prismlauncher") exec flatpak run org.prismlauncher.PrismLauncher ;;
    " air conditioner ON") exec sh -c '~/.local/bin/ac-on.sh && fyi -t 2000 "mqtt" "AC powered ON"' ;;
    " air conditioner OFF") exec sh -c '~/.local/bin/ac-off.sh && fyi -t 2000 "mqtt" "AC powered OFF"' ;;
    " color pick") color=$(grim -g "$(slurp -b 00000000 -p)" -t ppm - 2>/tmp/grim.err | convert - -format '%[pixel:p{0,0}]' txt:- 2>/tmp/convert.err | tail -n 1 | cut -d ' ' -f 4) && { echo "$color" | wl-copy; fyi -t 3000 "Picked" "$color"; } || fyi "Error" "Failed to pick color" ;;
    " vencord") exec flatpak run dev.vencord.Vesktop ;;
    " vencord kill") exec flatpak kill dev.vencord.Vesktop ;;
    " zen") exec flatpak run app.zen_browser.zen ;;
    "󰜉 reboot") exec lxqt-sudo reboot ;;
    "󰐥 shutdown") exec lxqt-sudo shutdown ;;
    "󰐥 poweroff") exec lxqt-sudo shutdown ;;
    " brightness MAX") exec lxqt-sudo brightnessctl set 15 ;;
    " brightness MIN") exec lxqt-sudo brightnessctl set 0 ;;
    "󰓓 steam") exec flatpak run com.valvesoftware.Steam ;;
    "󰓓 steam kill") exec flatpak kill com.valvesoftware.Steam ;;
    " time machine") exec record-buffer.sh save ;;
    "󰑈 last video") exec mpv ~/videos/$(ls -t ~/videos | head -n 1) ;;
    " last screenshot") exec imv ~/pictures/$(ls -t ~/pictures/screenshot-* | head -n 1) ;;
    "󰖩 nmtui") exec foot -e osh -c "sudo nmtui ; osh" ;;
    *) exit 1 ;;
esac
