;;; package --- Init -*- lexical-binding: t; -*-

;;; Commentary:
;; Inits configs

;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'core-config)
(require 'ui-config)
(require 'editing-config)
(require 'evil-config)
(require 'keybindings-config)
(require 'completion-config)
(require 'dev-config)
(require 'scheme-config)
;;; init.el ends here
