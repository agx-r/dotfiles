#!/usr/bin/env guile
!#
(define-module (ac-control)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim))

(define encrypted-file (string-append (getenv "HOME") "/.encrypted/mqtt-password.gpg"))

(define (decrypt-password)
  "Decrypt the MQTT password from the encrypted GPG file."
  (let ((port (open-input-pipe (string-append "gpg --quiet --decrypt " encrypted-file))))
    (let ((password (read-line port)))
      (close-pipe port)
      (if (eof-object? password)
          (begin
            (display "failed to decrypt\n")
            (exit 1))
          password))))

(define (publish-mqtt-message action)
  "Publish an MQTT message to control the air conditioner."
  (let ((mqtt-password (decrypt-password))
        (message (if (string=? action "on") "acbedroomon" "acbedroomoff")))
    (system (string-append
             "mosquitto_pub -h 192.168.1.191 "
             "-t \"homeassistant/script/run\" "
             "-m \"" message "\" "
             "-u mqtt "
             "-P \"" mqtt-password "\""))))

(define (main)
  (let ((args (command-line)))
    (if (= (length args) 2)
        (let ((action (cadr args)))
          (cond
           ((string=? action "on") (publish-mqtt-message "on"))
           ((string=? action "off") (publish-mqtt-message "off"))
           (else
            (display "Usage: ac-control.scm [on|off]\n")
            (exit 1))))
        (begin
          (display "Usage: ac-control.scm [on|off]\n")
          (exit 1)))))

(main)
