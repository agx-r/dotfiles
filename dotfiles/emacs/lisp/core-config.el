;; Basic settings
(setq inhibit-startup-message t
      visible-bell t
      scroll-margin 10
      auto-save-default nil
      make-backup-files nil
      evil-want-C-u-scroll t
      which-key-idle-delay 0.2)

;; GUI
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Soft line wrapping
(global-visual-line-mode 1)

(provide 'core-config)
