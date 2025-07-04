(setq geiser-active-implementations '(guile))

(add-hook 'scheme-mode-hook #'company-mode)
(add-hook 'geiser-repl-mode-hook #'company-mode)

(provide 'scheme-config)

