;; main utility functions for river

(use-modules (ice-9 format))

(define (riverctl . args)
  (apply system* (cons "riverctl" args)))

(define (spawn . args)
  (apply system* args))

(define (key-repeat . args)
  (apply riverctl
         (cons "set-repeat" args)))

(define (keymap layout variant options)
  (riverctl "keyboard-layout"
            "-variant" variant
            "-options" options
            layout))

(define (hex->string color)
  (format #f "0x~06X" color))

(define (bg-color color)
  (riverctl "background-color"
            (hex->string color)))

(define (border-color-focused color)
  (riverctl "border-color-focused"
            (hex->string color)))

(define (border-color-unfocused color)
  (riverctl "border-color-unfocused"
            (hex->string color)))

(define (border-color-urgent color)
  (riverctl "border-color-urgent"
            (hex->string color)))

(define (rule app-id action)
  (riverctl "rule-add" "-app-id" app-id action))


(define mode-table
  '((n . "normal")))

(define (default-layout layout)
  (riverctl "default-layout" layout))

(define sel "focus-view")
(define (bind mode modifier key cmd . args)
  (let* ((mode-str (assoc-ref mode-table mode)))
    (if (not mode-str)
        (error "unknown mode:" mode)
        (apply riverctl
               (append (list "map" mode-str modifier key cmd) args)))))

(define (define-workspaces names)
  (let ((bindings '(("Super"               "set-focused-tags")
                    ("Super+Shift"         "set-view-tags")
                    ("Super+Control"       "toggle-focused-tags")
                    ("Super+Shift+Control" "toggle-view-tags"))))
    (for-each
     (lambda (ws idx)
       (let ((tags (number->string (ash 1 idx))))
         (for-each
          (lambda (binding)
            (apply riverctl
                   (list "map" "normal" (car binding) ws (cadr binding) tags)))
          bindings)))
     names
     (iota (length names) 0))))

(define all-tags
  (- (ash 1 32) 1))
