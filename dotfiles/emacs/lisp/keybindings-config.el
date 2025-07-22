;;; package --- Keybindings -*- lexical-binding: t; -*-

;;; Commentary:
;; Keybindings

;;; Code:
(require 'general)

(defun my/copy-region-to-clipboard (beg end)
  (interactive "r")
  (let ((text (buffer-substring-no-properties beg end)))
    (let ((proc (start-process "wl-copy" "*Messages*" "wl-copy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(defun my/copy-region-to-clipboard-wrapper ()
  (interactive)
  (evil-visual-restore)
  (call-interactively #'my/copy-region-to-clipboard)
  (message "Copied region to clipboard")
  (evil-normal-state))

(defun my/select-inner-word ()
  (interactive)
  (evil-visual-make-selection
   (car (bounds-of-thing-at-point 'word))
   (cdr (bounds-of-thing-at-point 'word))
   'exclusive))

;; Generic
(general-define-key
 :states '(normal visual)
 :prefix nil
 "H" 'evil-beginning-of-line
 "N" 'end-of-defun
 "E" 'beginning-of-defun
 "I" 'evil-end-of-line

 "h" 'evil-backward-char
 "n" 'evil-next-line
 "e" 'evil-previous-line
 "i" 'evil-forward-char

 "f" 'evil-forward-word-end
 "b" 'evil-backward-word-begin
 "F" 'evil-forward-WORD-end
 "B" 'evil-backward-WORD-begin

 "u" 'evil-insert
 "y" 'evil-open-below
 "Y" 'evil-open-above

 "r" 'evil-replace

 "j" 'evil-yank
 ";" 'evil-paste-after
 ":" 'evil-paste-before

 "O" 'evil-ex
 "o" 'evil-ex

 "x" 'evil-visual-line
 "v" 'evil-visual-char

 "c" 'evil-search-word-forward
 "C" 'evil-search-word-backward

 "k" 'evil-search-next
 "K" 'evil-search-previous

 "%" 'mark-whole-buffer)

(general-define-key :states '(normal) "s" 'evil-delete-char)
(general-define-key :states '(visual) "s" 'evil-delete)

;; SPC - Generic
(general-define-key
 :keymaps '(normal visual)
 :prefix "SPC"
 "f"  'find-file

 "b"  'consult-buffer

 "q"  'delete-window

 "a"  'mark-whole-buffer

 "r"  'split-window-right
 "R"  'split-window-below

 "H"  'previous-buffer
 "I"  'next-buffer

 "h"  'windmove-left
 "n"  'windmove-down
 "e"  'windmove-up
 "i"  'windmove-right

 "c"  'comment-line
 "j"  'my/copy-region-to-clipboard-wrapper)

;; Dired
(general-define-key
 :keymaps 'dired-mode-map
 :states '(normal)
 "h" 'dired-up-directory
 "n" 'dired-next-line
 "e" 'dired-previous-line
 "i" 'dired-find-file

 "s" 'dired-do-delete
 "r" 'dired-do-rename

 "y" 'dired-create-directory

 "j" 'dired-do-copy
 ";" 'dired-do-symlink
 "u" 'dired-up-directory
 "l" 'dired-hide-details-mode
 "x" 'dired-mark
 "%" 'dired-mark-files-regexp
 "O" 'dired-omit-mode
 "K" 'dired-do-kill-lines
 "f" 'dired-find-file
 
 "u" 'dired-unmark
 "U" 'dired-unmark-all-marks
 "m" 'dired-mark

 "q" 'delete-window

 "O" 'evil-ex
 "o" 'evil-ex)

;; Telega root mode
(general-define-key
 :keymaps 'telega-root-mode-map
 :states '(normal)
 "q" 'telega-kill

 "O" 'evil-ex
 "o" 'evil-ex)

(provide 'keybindings-config)
;;; keybindings-config.el ends here

