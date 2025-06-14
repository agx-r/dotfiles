;;; package --- Keybindings

;;; Commentary:
;; Keybindings

;;; Code:
(require 'general)

;; Clear default bindings
(global-unset-key (kbd "C-x"))
(global-unset-key (kbd "C-c"))
(global-unset-key (kbd "M-x"))

(defun my/copy-region-to-clipboard (beg end)
  (interactive "r")
  (let ((text (buffer-substring-no-properties beg end)))
    (let ((proc (start-process "wl-copy" "*Messages*" "wl-copy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(with-eval-after-load 'evil
  (evil-ex-define-cmd "q" 'kill-buffer))

(defun my/copy-region-to-clipboard-wrapper ()
  (interactive)
  (evil-visual-restore)
  (call-interactively #'my/copy-region-to-clipboard)
  (message "Copied region to clipboard")
  (evil-normal-state))

(general-define-key
 :states '(normal visual)
 :prefix nil
 "n" 'evil-next-line
 "e" 'evil-previous-line
 "i" 'evil-forward-char
 "f" 'evil-forward-word-end
 "b" 'evil-backward-word-begin
 "u" 'evil-insert
 "r" 'evil-replace
 "j" 'evil-yank
 ";" 'evil-paste-after
 ":" 'evil-paste-before
 "y" 'evil-open-below
 "Y" 'evil-open-above
 "O" 'evil-ex
 "o" 'evil-ex
 "x" 'evil-visual-line
 "%" 'mark-whole-buffer
 "k" 'evil-search-next
 "K" 'evil-search-previous)

(general-define-key :states '(normal) "s" 'evil-delete-char)
(general-define-key :states '(visual) "s" 'evil-delete)

(general-define-key
 :keymaps '(normal visual)
 :prefix "SPC"
 "f"  'find-file
 "b"  'consult-buffer
 "H"  'previous-buffer
 "I"  'next-buffer
 "i"  'next-buffer
 "h"  'previous-buffer
 "c"  '(:which-key "terminal")
 "cc" 'vterm
 "j"  'my/copy-region-to-clipboard-wrapper
 "gb" 'evil-goto-line
 "gt" 'evil-goto-first-line)

(general-define-key
 :keymaps 'dired-mode-map
 :states '(normal)
 "n" 'evil-next-line
 "e" 'evil-previous-line
 "i" 'dired-find-file                 ; Open file
 "s" 'dired-do-delete                 ; Delete file
 "r" 'dired-do-rename                 ; Rename file
 "y" 'dired-create-directory          ; Create directory
 "j" 'dired-do-copy                   ; Copy file
 ";" 'dired-do-symlink                ; Create symlink
 "u" 'dired-up-directory              ; Go up directory
 "l" 'dired-hide-details-mode         ; Toggle details
 "x" 'dired-mark                      ; Mark file
 "%" 'dired-mark-files-regexp         ; Mark by regexp
 "O" 'dired-omit-mode                 ; Toggle omit mode
 "K" 'dired-do-kill-lines             ; Hide marked files
 "f" 'dired-find-file                 ; Open file (alternative)
 "u" 'dired-unmark                    ; Unmark file
 "U" 'dired-unmark-all-marks          ; Unmark all
 "m" 'dired-mark)                     ; Mark file (alternative)

(provide 'keybindings-config)
;;; keybindings-config.el ends here

