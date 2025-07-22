;;; package --- Init -*- lexical-binding: t; -*-

;;; Commentary:
;; Inits configs

;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'lean4-mode)
(require 'zig-mode)
(require 'rust-mode)

(require 'telega)

(require 'multiple-cursors)

(require 'flycheck)
(require 'magit)
(require 'vterm)
(require 'projectile)

(require 'vertico)
(require 'consult)
(require 'corfu)
(require 'company)

(require 'geiser)
(require 'geiser-guile)

(require 'rainbow-delimiters)

(require 'doom-modeline)

(require 'core-config)
(require 'ui-config)
(require 'editing-config)
(require 'evil-config)
(require 'keybindings-config)
(require 'completion-config)
(require 'dev-config)
(require 'scheme-config)
;;; init.el ends here
