;;; package --- Core configs

;;; Commentary:
;; Core configs for Emacs

;;; Code:
;; Basic settings
(setq inhibit-startup-message t
      visible-bell t
      scroll-margin 10
      auto-save-default nil
      make-backup-files nil)

;; FUCKING BULLSHIT
(setq require-final-newline nil)

;; Soft line wrapping
(global-visual-line-mode 1)

(provide 'core-config)
;;; core-config.el ends here
