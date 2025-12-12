#!/usr/bin/env guile
!#
(define-module (launcher)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-1))

(define (preload name)
  (string-append "LD_PRELOAD="
                 (getenv "HOME")
                 "/.ld-preloads/"
                 name
                 " "))

(define launch-items
  (list
   (cons "lock" "~/.bin/lock.scm")
   (cons "files" "nixGLIntel cosmic-files")
   (cons "player" "nixGLIntel cosmic-player")
   (cons "tasks" "nixGLIntel tasks")
   (cons "reader" "nixGLIntel cosmic-reader")
   (cons "examine" "nixGLIntel examine")
   (cons "libresprite" "nixGLIntel libresprite")
   (cons "screenshot" "grim ~/screenshot.png")
   (cons "picker" "hyprpicker -a")
   (cons "reboot" "foot -a floating -e sh -c 'echo Reboot ? ; doas reboot'")
   (cons "poweroff" "foot -a floating -e sh -c 'echo Power OFF ? ; doas poweroff'")
   (cons "nmtui" "foot -a floating -e doas nmtui")
   (cons "ayugram"
         (string-append (preload "libemacsqt.so")
                        "AyuGram"))
   (cons "discord" "nixGLIntel vesktop")
   (cons "libreoffice" "nixGLIntel libreoffice")
   (cons "floorp" "nixGLIntel floorp")
   (cons "obs" "nixGLIntel obs")
   (cons "ghidra" "_JAVA_AWT_WM_NONREPARENTING=1 ghidra")))

(define (main)
  (let* ((choices (map car launch-items))
         (choice (with-input-from-port (open-input-pipe (string-append "echo \""
                                                                       (string-join choices "\n")
                                                                       "\" | fuzzel --dmenu -l 8 -w 20"))
                 read-line))
         (cmd (assoc-ref launch-items choice)))
    (if cmd
        (system cmd)
        (exit 1))))

(main)
