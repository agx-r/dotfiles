#!/usr/bin/env guile
!#
(define-module (launcher)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-1))

(define launch-items
  '(("󰌾 lock"             . "swaylock --screenshots --indicator-radius 100 --indicator-thickness 17 --effect-blur 10x10 --clock")
    ("󰖟 floorp"           . "nixGLIntel floorp")
    ("󰍡 ayugram"          . "AyuGram")
    ("󰜉 reboot"           . "foot -a floating -e sh -c 'echo Reboot ? ; doas reboot'")
    ("󰐥 poweroff"         . "foot -a floating -e sh -c 'echo Power OFF ? ; doas poweroff'")
    ("󱩖 brightness UP"    . "light -A 10")
    ("󰛩 brightness DOWN"  . "light -U 10")
    ("󰖩 nmtui"            . "foot -a floating -e doas nmtui")
    ("󱄅 hm"               . "foot -D ~/.config/home-manager/ -L nu")
    ("󰐷 ghidra"           . "_JAVA_AWT_WM_NONREPARENTING=1 ghidra")))

(define (main)
  (let* ((choices (map car launch-items))
         (choice (with-input-from-port
                     (open-input-pipe
                      (string-append "echo \"" (string-join choices "\n") "\" | fuzzel --dmenu -l 8 -w 20"))
                   read-line))
         (cmd (assoc-ref launch-items choice)))
    (if cmd
        (system cmd)
        (exit 1))))

(main)
