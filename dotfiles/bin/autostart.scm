#!/home/agx/.nix-profile/bin/guile -s
!#

(define (run-background cmd . args)
  (let ((pid (primitive-fork)))
    (if (= pid 0)
        (begin
          (apply system* cmd args)
          (exit 0))
        (begin
          (format #t "Started ~a (pid ~a)\n" cmd pid)
          pid))))

(load (string-append (getenv "HOME") "/.bin/ui.scm"))
(load (string-append (getenv "HOME") "/.bin/audio.scm"))
(load (string-append (getenv "HOME") "/.bin/tiling.scm"))

