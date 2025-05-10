(use-modules (guix gexp)
             (guix utils)
             (gnu home)
             (gnu packages)
             (gnu services)
             (gnu home services))

;; Define required Emacs packages
(define home-emacs-packages
  (map specification->package
       '("emacs-pgtk"           ; Modern Emacs with PGTK for Wayland
         "emacs-evil"           ; Vim-like keybindings
         "emacs-general"        ; Flexible keybinding management
         "emacs-which-key"      ; Keybinding hints
	 "emacs-nerd-icons"     ; Nerd fonts
         "emacs-doom-modeline"  ; Modern modeline
         "emacs-vertico"        ; Minimal completion framework
         "emacs-marginalia"     ; Completion annotations
         "emacs-consult"        ; Enhanced search and navigation
         "emacs-catppuccin-theme"   ; Aesthetic theme
         "emacs-corfu"              ; Completion UI
         "emacs-magit"              ; Git integration
         "emacs-vterm"              ; Terminal emulator
         "emacs-rainbow-delimiters" ; Colored brackets
         "emacs-projectile"     ; Project management
         "emacs-flycheck"       ; Syntax checking
         "emacs-company"
	 "emacs-geiser"
	 "emacs-geiser-guile")))

;; Define Emacs configuration
(define home-emacs-config
  (plain-file "init.el"
	      ";; init.el

(set-face-attribute 'default nil :font \"FiraCode Nerd Font Mono\" :height 120)
(set-fontset-font t 'unicode \"FiraCode Nerd Font Mono\" nil 'prepend)
(set-fontset-font t '(#x1f300 . #x1fad0) \"FiraCode Nerd Font Mono\" nil 'prepend)

;; -*- lexical-binding: t -*-

;; === Package Setup ===
(require 'evil)
(evil-mode 1)                    ; Vim
(require 'general)               ; Keybinding management

(require 'which-key)
(which-key-mode 1)               ; Show keybinding hints

(require 'doom-modeline)
(doom-modeline-mode 1)           ; Modern modeline

(require 'vertico)
(vertico-mode 1)                 ; Completion framework

(require 'marginalia)
(marginalia-mode 1)              ; Completion annotations

(require 'consult)               ; Enhanced search and navigation

(require 'corfu)
(global-corfu-mode 1)            ; Completion UI

(require 'rainbow-delimiters)    ; Rainbow brackets
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'magit)                 ; Git integration
(require 'vterm)                 ; Terminal emulator

(require 'projectile)
(projectile-mode 1)              ; Project management

(require 'flycheck)
(global-flycheck-mode 1)         ; Syntax checking

(require 'company)
(global-company-mode 1)          ; Code completion

;; === Scheme / Guix support ===
(require 'geiser)
(setq geiser-active-implementations '(guile))

(require 'geiser-guile)

(add-hook 'scheme-mode-hook #'company-mode)
(add-hook 'geiser-repl-mode-hook #'company-mode)

;; (add-hook 'scheme-mode-hook
;;            (lambda () (unless (geiser-repl--live-p) (run-geiser))))

;; === Evil disable ===
(defun my/geiser-disable-evil-and-linenumbers ()
  \"Disable evil mode and line numbers in Geiser-related buffers.\"
  (evil-local-mode -1)
  (display-line-numbers-mode -1))

(add-hook 'geiser-repl-mode-hook #'my/geiser-disable-evil-and-linenumbers)
(add-hook 'geiser-doc-mode-hook #'my/geiser-disable-evil-and-linenumbers)
(add-hook 'geiser-autodoc-mode-hook #'my/geiser-disable-evil-and-linenumbers)
(add-hook 'geiser-debug-mode-hook #'my/geiser-disable-evil-and-linenumbers)

;; === Editor Settings ===
(global-display-line-numbers-mode 1)        ; Show line numbers
(setq display-line-numbers-type 'relative)  ; Use relative line numbers
(setq scroll-margin 10)                     ; Keep 10 lines above/below cursor
(global-visual-line-mode 1)                 ; Enable soft wrapping
(setq inhibit-startup-message t)            ; Disable startup screen
(scroll-bar-mode -1)                        ; Disable scroll bars
(tool-bar-mode -1)                          ; Disable tool bar
(menu-bar-mode -1)                          ; Disable menu bar
(setq inhibit-startup-message t)            ; Disable startup screen
(setq visible-bell t)                       ; Use visible bell
(setq evil-want-C-u-scroll t)               ; Enable C-u for scrolling
(setq which-key-idle-delay 0.2)             ; Faster which-key hints
(setq auto-save-default nil)                ; Disable auto-save
(setq make-backup-files nil)                ; Disable backups

;; === UI Customization ===
;; Cursor shapes for Evil modes
(setq evil-insert-state-cursor 'bar
      evil-normal-state-cursor 'hollow
      evil-visual-state-cursor 'box)

;; Load Catppuccin theme if available
(when (require 'catppuccin-theme nil t)
  (load-theme 'catppuccin t)
  (message \"Loaded Catppuccin theme: %s\" (custom-available-themes)))
(unless (member 'catppuccin (custom-available-themes))
  (message \"Warning: Catppuccin theme not found, using default\"))

;; === Keybindings ===
;; Clear default Emacs keybindings
(global-unset-key (kbd \"C-x\"))
(global-unset-key (kbd \"C-c\"))
(global-unset-key (kbd \"M-x\"))

;; Helix-inspired keybindings (normal and visual modes)
(general-define-key
 :states '(normal visual)
 :prefix nil

 \"n\" 'evil-next-line            ; Move down
 \"e\" 'evil-previous-line        ; Move up
 \"i\" 'evil-forward-char         ; Move right

 \"f\" 'evil-forward-word-end     ; Move to next word end

 \"u\" 'evil-insert               ; Enter insert mode
 \"r\" 'evil-replace              ; Replace character
 \"j\" 'evil-yank                 ; Yank (copy)

 \";\" 'evil-paste-after          ; Paste after cursor
 \":\" 'evil-paste-before         ; Paste after cursor

 \"y\" 'evil-open-below           ; Open line below
 \"Y\" 'evil-open-above           ; Open line above

 \"O\" 'evil-ex                   ; Command mode (:)

 \"x\" 'evil-visual-line          ; Select line
 \"%\" 'mark-whole-buffer         ; Select all

 \"k\" 'evil-search-next          ; Next search match
 \"K\" 'evil-search-previous      ; Previous search match
 \"l\" 'evil-undo                 ; Undo
 \"L\" 'evil-redo)                ; Redo

(general-define-key
 :states '(normal)
 :prefix nil
 \"s\" 'evil-delete-char)

(general-define-key
 :states '(visual)
 \"s\" 'evil-delete)

(defun my/copy-region-to-clipboard (beg end)
  \"Copy selected region to system clipboard using wl-copy.\"
  (interactive \"r\")
  (let ((text (buffer-substring-no-properties beg end)))
    (let ((process-connection-type nil))
      (let ((proc (start-process \"wl-copy\" \"*Messages*\" \"wl-copy\")))
        (process-send-string proc text)
        (process-send-eof proc)))))

;; Original and additional leader keybindings (SPC prefix)
(general-define-key
 :keymaps '(normal visual) 
 :prefix \"SPC\"
 \"f\"  '(:which-key \"file\")     ; File operations
 \"ff\" 'find-file                 ; Open file
 \"b\"  'consult-buffer            ; Switch buffer
 \"H\"  'previous-buffer           ; Previous buffer
 \"I\"  'next-buffer               ; Next buffer
 \"b\"  '(:which-key \"buffer\")   ; Buffer operations
 \"p\"  '(:which-key \"project\")  ; Project operations
 \"pf\" 'projectile-find-file      ; Find file in project
 \"c\"  '(:which-key \"terminal\") ; Terminal operations
 \"cc\" 'vterm                     ; Open vterm
 \"j\"  '(my/copy-region-to-clipboard :which-key \"copy to clipboard\")         ; Copy to system clipboard
 \"gb\"  'evil-goto-line           ; Move to bottom of buffer
 \"gt\"  'evil-goto-first-line)    ; Move to top of buffer

;; Original global keybindings
(global-set-key (kbd \"C-x g\") 'magit-status) ; Magit status
"))
