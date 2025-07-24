;;; editing-config.el --- Configuration for enhanced word highlighting

;; Включаем rainbow-delimiters для всех режимов программирования
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun my/highlight-word-at-point ()
  "Подсвечивать слово под курсором в normal-режиме Evil с цветом region, очищая старые подсветки."
  (interactive)
  ;; Очищаем все предыдущие подсветки
  (when (fboundp 'hi-lock-unface-buffer)
    (hi-lock-unface-buffer t))
  ;; Получаем слово под курсором
  (let ((word (thing-at-point 'word t)))
    (when (and word (evil-normal-state-p))
      ;; Подсвечиваем слово с использованием лица region
      (highlight-regexp (concat "\\b" (regexp-quote word) "\\b") 'region))))

(defun my/clear-word-highlights ()
  "Очищать подсветку при входе в visual или insert-режим."
  (when (fboundp 'hi-lock-unface-buffer)
    (hi-lock-unface-buffer t)))

(global-hi-lock-mode 1)

(add-hook 'evil-visual-state-entry-hook 'my/clear-word-highlights)
(add-hook 'evil-insert-state-entry-hook 'my/clear-word-highlights)

(provide 'editing-config)
;;; editing-config.el ends here
