;;; evil-config.el --- Evil mode configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Evil config

;;; Code:
(evil-mode 1)
(global-evil-mc-mode 1)

;; Cursor shapes
(setq evil-insert-state-cursor 'bar
      evil-normal-state-cursor 'hollow
      evil-visual-state-cursor 'box)

(dolist (hook '(geiser-repl-mode-hook
                geiser-doc-mode-hook
                geiser-autodoc-mode-hook
                geiser-debug-mode-hook)))

(provide 'evil-config)
;;; evil-config.el ends here
