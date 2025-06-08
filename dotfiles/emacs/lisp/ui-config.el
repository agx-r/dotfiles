;;; package --- UI Config

;;; Commentary:
;; Describes the user interface

;;; Code:
;;; Font
(set-face-attribute 'default nil :font "Hurmit Nerd Font" :height 120)

;; Theme
(when (require 'catppuccin-theme nil t)
  (load-theme 'catppuccin t)
  (message "Loaded Catppuccin theme: %s" (custom-available-themes)))
(unless (member 'catppuccin (custom-available-themes))
  (message "Warning: Catppuccin theme not found, using default"))

;; Doom modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

(provide 'ui-config)
;;; ui-config.el ends here
