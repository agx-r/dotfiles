#!/usr/bin/env guile
!#
(define-module (launcher)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-1))

(define launch-list-file "~/.config/fuzzel/launch-list")

(define (expand-home path)
  "Expand ~ in a path to the user's home directory."
  (if (string-prefix? "~" path)
      (string-append (getenv "HOME") (substring path 1))
      path))

(define (read-launch-list)
  (call-with-input-file (expand-home launch-list-file)
    (lambda (port)
      (let loop ((lines '()))
        (let ((line (read-line port)))
          (if (eof-object? line)
              (reverse lines)
              (loop (cons line lines))))))))

(define (main)
  (let* ((choices (read-launch-list))
         (choice (with-input-from-port
                  (open-input-pipe
                   (string-append "echo \"" (string-join choices "\n") "\" | fuzzel --dmenu"))
                  read-line)))
    (cond
     ((string=? choice " qutebrowser") (system "qutebrowser"))
     ((string=? choice " librewolf") (system "librewolf"))
     ((string=? choice " chromium") (system "chromium"))
     ((string=? choice "󱋿 wireplumber") (system "wireplumber"))
     ((string=? choice "󱋿 wireplumber kill") (system "pkill wireplumber"))
     ((string=? choice " icedove") (system "icedove"))
     ((string=? choice " ranger") (system "foot -e ranger"))
     ((string=? choice " emacs client") (system "emacsclient"))
     ((string=? choice " emacs standalone") (system "emacs"))
     ((string=? choice " telegram") (system "flatpak run org.telegram.desktop"))
     ((string=? choice " telegram kill") (system "flatpak kill org.telegram.desktop"))
     ((string=? choice " libreoffice") (system "flatpak run org.libreoffice.LibreOffice"))
     ((string=? choice "󰕧 obs studio") (system "flatpak run com.obsproject.Studio"))
     ((string=? choice " inkscape") (system "flatpak run org.inkscape.Inkscape"))
     ((string=? choice " freecad") (system "flatpak run org.freecad.FreeCAD"))
     ((string=? choice " prismlauncher") (system "flatpak run org.prismlauncher.PrismLauncher"))
     ((string=? choice " air conditioner ON") (system "~/.local/bin/ac-control.scm on && fyi -t 2000 mqtt 'AC powered ON'"))
     ((string=? choice " air conditioner OFF") (system "~/.local/bin/ac-control.scm off && fyi -t 2000 mqtt 'AC powered OFF'"))
     ((string=? choice " color pick")
      (let ((color (with-input-from-port
                    (open-input-pipe
                     "grim -g \"$(slurp -b 00000000 -p)\" -t ppm - 2>/tmp/grim.err | convert - -format '%[pixel:p{0,0}]' txt:- 2>/tmp/convert.err | tail -n 1 | cut -d ' ' -f 4")
                    read-line)))
        (if color
            (begin
              (system (string-append "echo \"" color "\" | wl-copy"))
              (system (string-append "fyi -t 3000 Picked \"" color "\"")))
            (system "fyi Error 'Failed to pick color'"))))
     ((string=? choice " vencord") (system "flatpak run dev.vencord.Vesktop"))
     ((string=? choice " vencord kill") (system "flatpak kill dev.vencord.Vesktop"))
     ((string=? choice " zen") (system "flatpak run app.zen_browser.zen"))
     ((string=? choice "󰜉 reboot") (system "lxqt-sudo reboot"))
     ((string=? choice "󰐥 shutdown") (system "lxqt-sudo shutdown"))
     ((string=? choice "󰐥 poweroff") (system "lxqt-sudo shutdown"))
     ((string=? choice "󰃠 brightness MAX") (system "lxqt-sudo brightnessctl set 15"))
     ((string=? choice "󰃟 brightness DEF") (system "lxqt-sudo brightnessctl set 10"))
     ((string=? choice "󰃞 brightness MIN") (system "lxqt-sudo brightnessctl set 0"))
     ((string=? choice " kdenlive") (system "flatpak run org.kde.kdenlive"))
     ((string=? choice "󰈇 remmina") (system "flatpak run org.remmina.Remmina"))
     ((string=? choice "󰓓 steam") (system "flatpak run com.valvesoftware.Steam"))
     ((string=? choice "󰓓 steam kill") (system "flatpak kill com.valvesoftware.Steam"))
     ((string=? choice " time machine") (system "record-buffer.sh save"))
     ((string=? choice "󰑈 last video") (system "mpv ~/videos/$(ls -t ~/videos | head -n 1)"))
     ((string=? choice " last screenshot") (system "imv $(ls -t ~/pictures/screenshot-* | head -n 1)"))
     ((string=? choice "󰖩 nmtui") (system "foot -e sudo nmtui"))
     ((string=? choice "󰃒 split vertical") (system "swaymsg layout splitv"))
     ((string=? choice "󰃊 split horizontal") (system "swaymsg layout splith"))
     ((string=? choice "󰓪 split tabbed") (system "swaymsg layout tabbed"))
     ((string=? choice " dotfiles dir") (system "foot -D ~/guix-home/dotfiles/"))
     ((string=? choice " guix home") (system "foot -D ~/guix-home/"))
     ((string=? choice " projects") (system "foot -D ~/projects/"))
     ((string=? choice "󰂯 bluetoothctl") (system "foot -e sudo bluetoothctl"))
     ((string=? choice "󰑓 sway reload") (system "swaymsg reload"))
     (else (exit 1)))))

(main)
