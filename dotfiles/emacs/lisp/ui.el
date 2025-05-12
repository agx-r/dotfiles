;; Fonts
(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono" :height 120)
(set-fontset-font t 'unicode "FiraCode Nerd Font Mono" nil 'prepend)
(set-fontset-font t '(#x1f300 . #x1fad0) "FiraCode Nerd Font Mono" nil 'prepend)

;; Theme
(when (require 'catppuccin-theme nil t)
  (load-theme 'catppuccin t)
  (message "Loaded Catppuccin theme: %s" (custom-available-themes)))
(unless (member 'catppuccin (custom-available-themes))
  (message "Warning: Catppuccin theme not found, using default"))

;; Doom modeline
(require 'doom-modeline)
(doom-modeline-mode 1)
