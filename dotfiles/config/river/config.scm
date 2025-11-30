(define terminal "nixGLIntel cosmic-term")
(define browser "nixGLIntel floorp")
(define filemanager "thunar")
(define editor "emacsclient -c")
(define menu "~/.bin/fuzzel-menu.scm")
(define smenu "fuzzel")
(define -light "light -U 10")
(define +light "light -A 10")
(define lock "~/.bin/lock.scm")

(define move-distance-vert 100)
(define move-distance-hor 180)

(rule "*" "ssd")
(rule "bar" "csd")
(rule "floating" "float")
(rule "io.github.cosmic_utils.Examine" "float")

(default-layout "rivertile")

(define resize-step 100)

(spawn (string-append (getenv "HOME") "/.bin/autostart.scm"))

(bg-color color-base)

(border-color-unfocused color-bright)
(border-color-focused color-pink)
(border-color-urgent color-cyan)

(key-repeat "50" "200")
(putenv (string-append "XKB_DEFAULT_COMPOSE_FILE=" (getenv "HOME") "/.XCompose"))
(keymap "us,ru" "colemak," "grp:win_space_toggle,compose:ralt")

(define-workspaces '("A" "R" "S" "T"))

(bind 'n "Super" "L" "spawn" lock)
(bind 'n "Super" "Q" "spawn" terminal)
(bind 'n "Super" "B" "spawn" filemanager)
(bind 'n "Super" "D" "spawn" menu)
(bind 'n "Super" "Z" "zoom")

(bind 'n "Super+Shift" "B" "spawn" browser)
(bind 'n "Super+Shift" "D" "spawn" smenu)
(bind 'n "Super+Shift" "F" "spawn" editor)

(bind 'n "Super" "C" "close")
(bind 'n "Super" "V" "toggle-float")
(bind 'n "Super" "F" "toggle-fullscreen")

(bind 'n "Super+Shift" "M" "exit")

(bind 'n "Super" "I" "focus-view" "next")
(bind 'n "Super" "H" "focus-view" "previous")
(bind 'n "Super" "N" "focus-view" "next")
(bind 'n "Super" "E" "focus-view" "previous")

(bind 'n "Super+Shift" "I" "swap" "next")
(bind 'n "Super+Shift" "H" "swap" "previous")
(bind 'n "Super+Shift" "N" "swap" "next")
(bind 'n "Super+Shift" "E" "swap" "previous")

(bind 'n "None" "XF86MonBrightnessUp" "spawn" +light)
(bind 'n "None" "XF86MonBrightnessDown" "spawn" -light)

(bind 'n "Super+Alt" "I" "move" "right" (number->string move-distance-hor))
(bind 'n "Super+Alt" "H" "move" "left" (number->string move-distance-hor))
(bind 'n "Super+Alt" "N" "move" "down" (number->string move-distance-vert))
(bind 'n "Super+Alt" "E" "move" "up" (number->string move-distance-vert))

(bind 'n "Super+Alt+Shift" "I" "resize" "horizontal" (number->string resize-step))
(bind 'n "Super+Alt+Shift" "H" "resize" "horizontal" (number->string (- resize-step)))
(bind 'n "Super+Alt+Shift" "N" "resize" "vertical" (number->string (- resize-step)))
(bind 'n "Super+Alt+Shift" "E" "resize" "vertical" (number->string resize-step))

(riverctl "map-pointer" "normal" "Super" "BTN_LEFT" "move-view")
(riverctl "map-pointer" "normal" "Super" "BTN_RIGHT" "resize-view")

(bind 'n "Super" "0" "set-focused-tags" (number->string all-tags))
