#!/usr/bin/env guile
!#
(define-module (launcher)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-1))

;; Один список, объединяющий имя и команду
(define launch-items
  '(("󰖟 floorp"           . "nixGLIntel floorp")
    ("󰍡 ayugram"          . "AyuGram")
    ("󰜉 reboot"           . "foot -e sh -c 'echo Reboot ? ; doas reboot'")
    ("󰐥 poweroff"         . "foot -e sh -c 'echo Power OFF ? ; doas poweroff'")
    ("󱩖 brightness UP"    . "light -A 10")
    ("󰛩 brightness DOWN"  . "light -U 10")
    ("󰖩 nmtui"            . "foot -e doas nmtui")
    ("󱄅 hm"               . "foot -D ~/.config/home-manager/")
    ("󰐷 ghidra"           . "_JAVA_AWT_WM_NONREPARENTING=1 ghidra")))

(define (main)
  (let* ((choices (map car launch-items))
         (choice (with-input-from-port
                     (open-input-pipe
                      (string-append "echo \"" (string-join choices "\n") "\" | fuzzel --dmenu -l 8"))
                   read-line))
         (cmd (assoc-ref launch-items choice)))
    (if cmd
        (system cmd)
        (exit 1))))

(main)
