#!/usr/bin/env guile
!#
(define-module (launcher)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-1))

;; Один список, объединяющий имя и команду
(define launch-items
  '((" floorp"           . "floorp")
    (" ayugram"          . "AyuGram")
    (" color pick"       . "grim -g \"$(slurp -b 00000000 -p)\" -t ppm - 2>/tmp/grim.err | convert - -format '%[pixel:p{0,0}]' txt:- 2>/tmp/convert.err | tail -n 1 | cut -d ' ' -f 4 | wl-copy && fyi -t 3000 'Picked color'")
    ("󰜉 reboot"           . "reboot")
    ("󰐥 poweroff"         . "poweroff")
    ("󰃠 brightness UP"    . "light -A 10")
    ("󰃞 brightness DOWN"  . "light -U 10")
    ("󰖩 nmtui"            . "foot -e doas nmtui")
    (" hm"               . "foot -D ~/.config/home-manager/")))

(define (main)
  (let* ((choices (map car launch-items))
         (choice (with-input-from-port
                     (open-input-pipe
                      (string-append "echo \"" (string-join choices "\n") "\" | fuzzel --dmenu"))
                   read-line))
         (cmd (assoc-ref launch-items choice)))
    (if cmd
        (system cmd)
        (exit 1))))

(main)
