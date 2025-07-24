(use-modules (guix gexp)
             (guix utils)
             (gnu home)
             (gnu packages)
             (gnu services)
             (gnu home services))

;; Define required Emacs packages
(define home-emacs-packages
  (map specification->package
       '("emacs-pgtk"
	 "emacs-evil"
         "emacs-general"
	 "emacs-linum-relative"
         "emacs-which-key"
	 "emacs-nerd-icons"
         "emacs-doom-modeline"
         "emacs-vertico"
         "emacs-marginalia"
         "emacs-consult"
         "emacs-catppuccin-theme"
         "emacs-corfu"
         "emacs-magit"
         "emacs-vterm"
         "emacs-rainbow-delimiters"
         "emacs-projectile"
         "emacs-flycheck"
	 "emacs-rust-mode"
	 "emacs-lean4-mode"
	 "emacs-zig-mode"
	 "emacs-elixir-mode"
	 "emacs-multiple-cursors"
	 "emacs-evil-mc"
	 "emacs-telega"
         "emacs-company"
	 "emacs-geiser"
	 "emacs-geiser-guile")))
