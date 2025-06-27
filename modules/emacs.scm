(use-modules (guix gexp)
             (guix utils)
             (gnu home)
             (gnu packages)
             (gnu services)
             (gnu home services))

;; Define required Emacs packages
(define home-emacs-packages
  (map specification->package
       '("emacs-pgtk"           ; Modern Emacs with PGTK for Wayland
         "emacs-evil"           ; Vim-like keybindings
         "emacs-general"        ; Flexible keybinding management
         "emacs-which-key"      ; Keybinding hints
	 "emacs-nerd-icons"     ; Nerd fonts
         "emacs-doom-modeline"  ; Modern modeline
         "emacs-vertico"        ; Minimal completion framework
         "emacs-marginalia"     ; Completion annotations
         "emacs-consult"        ; Enhanced search and navigation
         "emacs-catppuccin-theme"   ; Aesthetic theme
         "emacs-corfu"              ; Completion UI
         "emacs-magit"              ; Git integration
         "emacs-vterm"              ; Terminal emulator
         "emacs-rainbow-delimiters" ; Colored brackets
         "emacs-projectile"     ; Project management
         "emacs-flycheck"       ; Syntax checking
	 "emacs-rust-mode"      ; Rust mode
         "emacs-company"
	 "emacs-geiser"
	 "emacs-geiser-guile")))
