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

;; wl-clipboard for pgtk
(setq wl-copy-process nil)

(defun wl-copy (text)
  (setq wl-copy-process (make-process :name "wl-copy"
				      :buffer nil
				      :command '("wl-copy" "-f" "-n")
				      :connection-type 'pipe
				      :noquery t))
  (process-send-string wl-copy-process text)
  (process-send-eof wl-copy-process))

(defun wl-paste ()
  (if (and wl-copy-process (process-live-p wl-copy-process))
      nil
    (shell-command-to-string "wl-paste -n")))

(setq interprogram-cut-function 'wl-copy)
(setq interprogram-paste-function 'wl-paste)

;; BULLSHIT
(setq require-final-newline nil)

;; Soft line wrapping
(global-visual-line-mode 1)

(provide 'core-config)
;;; core-config.el ends here
