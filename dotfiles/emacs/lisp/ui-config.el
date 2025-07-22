;;; package --- UI Config

;;; Commentary:
;; Describes the user interface

;;; Code:

;;; Basic settings
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line numbers
;; (global-display-line-numbers-mode 1)
;; (setq display-line-numbers-type 'relative) ;; or absolute
(add-hook 'prog-mode-hook 'linum-relative-mode)

;;; Font
(set-face-attribute 'default nil :font "Hurmit Nerd Font" :height 120)

;; Theme
(when (require 'catppuccin-theme nil t)
  (load-theme 'catppuccin t)
  (message "Loaded Catppuccin theme: %s" (custom-available-themes)))
(unless (member 'catppuccin (custom-available-themes))
  (message "Warning: Catppuccin theme not found, using default"))

;; Doom modeline
(doom-modeline-mode 1)

(provide 'ui-config)
;;; ui-config.el ends here
