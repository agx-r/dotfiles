#!/usr/bin/guile
!#

(use-modules (ice-9 system)
             (ice-9 format))

(define (run-background cmd . args)
  (let ((pid (spawn cmd args)))
    (format #t "Started ~a (pid ~a)\n" cmd pid)
    pid))

(load (string-append (getenv "HOME") "/.bin/ui.scm"))
(load (string-append (getenv "HOME") "/.bin/audio.scm"))
(load (string-append (getenv "HOME") "/.bin/tiling.scm"))

