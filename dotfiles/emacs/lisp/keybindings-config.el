(require 'general)

;; Clear default bindings
(global-unset-key (kbd "C-x"))
(global-unset-key (kbd "C-c"))
(global-unset-key (kbd "M-x"))

;; Helix-style keys
(general-define-key
 :states '(normal visual)
 :prefix nil
 "n" 'evil-next-line
 "e" 'evil-previous-line
 "i" 'evil-forward-char
 "f" 'evil-forward-word-end
 "u" 'evil-insert
 "r" 'evil-replace
 "j" 'evil-yank
 ";" 'evil-paste-after
 ":" 'evil-paste-before
 "y" 'evil-open-below
 "Y" 'evil-open-above
 "O" 'evil-ex
 "x" 'evil-visual-line
 "%" 'mark-whole-buffer
 "k" 'evil-search-next
 "K" 'evil-search-previous
 "l" 'evil-undo
 "L" 'evil-redo)

(general-define-key :states '(normal) "s" 'evil-delete-char)
(general-define-key :states '(visual) "s" 'evil-delete)

(defun my/copy-region-to-clipboard (beg end)
  (interactive "r")
  (let ((text (buffer-substring-no-properties beg end)))
    (let ((proc (start-process "wl-copy" "*Messages*" "wl-copy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(general-define-key
 :keymaps '(normal visual)
 :prefix "SPC"
 "f"  '(:which-key "file")
 "ff" 'find-file
 "b"  '(:which-key "buffer")
 "b"  'consult-buffer
 "H"  'previous-buffer
 "I"  'next-buffer
 "p"  '(:which-key "project")
 "pf" 'projectile-find-file
 "c"  '(:which-key "terminal")
 "cc" 'vterm
 "j"  '(my/copy-region-to-clipboard :which-key "copy to clipboard")
 "gb" 'evil-goto-line
 "gt" 'evil-goto-first-line)

(global-set-key (kbd "C-x g") 'magit-status)

(provide 'keybindings-config)

