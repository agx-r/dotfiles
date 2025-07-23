;;; editing-config.el --- Configuration for enhanced word highlighting

;; Включаем rainbow-delimiters для всех режимов программирования
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun highlight-word-at-point ()
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

(defun clear-highlight-on-mode-change ()
  "Очищать подсветку при входе в visual или insert-режим."
  (when (fboundp 'hi-lock-unface-buffer)
    (hi-lock-unface-buffer t)))

;; Включаем hi-lock-mode глобально
(global-hi-lock-mode 1)

;; Подсветка в normal-режиме
(add-hook 'evil-normal-state-entry-hook 'highlight-word-at-point)

;; Очистка подсветки при входе в visual-режим
(add-hook 'evil-visual-state-entry-hook 'clear-highlight-on-mode-change)

;; Очистка подсветки при входе в insert-режим
(add-hook 'evil-insert-state-entry-hook 'clear-highlight-on-mode-change)

;; Запускаем подсветку при перемещении курсора в normal-режиме
(add-hook 'post-command-hook
          (lambda ()
            (when (evil-normal-state-p)
              (highlight-word-at-point))))

(provide 'editing-config)
;;; editing-config.el ends here
