;;; init.el --- My Emacs config -*- lexical-binding: t; -*-

;;; Commentary:
;; Init configs with use-package

;;; Code:
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; --- Programming languages ---
(use-package zig-mode)
(use-package rust-mode)

;; Lean4
(use-package lean4-mode
  :vc (:url "https://github.com/leanprover-community/lean4-mode.git"
       :rev :last-release))
 
;; --- Editing ---
(use-package lsp-mode
  :hook ((rust-mode . lsp)
         (zig-mode . lsp)
         (lean4-mode . lsp)))
(use-package flycheck)
(use-package multiple-cursors)
(use-package evil-mc)
(use-package evil
  :config (evil-mode 1))
(use-package general)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package vertico
  :init (vertico-mode))
(use-package consult)
(use-package corfu)
(use-package company)

;; --- Git ---
(use-package magit)
(use-package magit-section)

;; --- Lisp ---
(use-package geiser)
(use-package geiser-guile)

;; --- Projectile ---
(use-package projectile
  :config (projectile-mode 1))

;; --- Configs ---
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'ui-config)
(require 'core-config)
(require 'editing-config)
(require 'evil-config)
(require 'keybindings-config)
(require 'completion-config)
(require 'dev-config)

;;; init.el
