(require 'evil)
(evil-mode 1)

;; Cursor shapes
(setq evil-insert-state-cursor 'bar
      evil-normal-state-cursor 'hollow
      evil-visual-state-cursor 'box)

(defun my/geiser-disable-evil-and-linenumbers ()
  (evil-local-mode -1)
  (display-line-numbers-mode -1))

(dolist (hook '(geiser-repl-mode-hook
                geiser-doc-mode-hook
                geiser-autodoc-mode-hook
                geiser-debug-mode-hook))
  (add-hook hook #'my/geiser-disable-evil-and-linenumbers))
