(use-modules (guix utils)
             (guix gexp)
             (gnu home)
             (gnu home services)
             (gnu packages)
             (gnu services))

(define home-package-list
  (load (string-append (getenv "HOME") "/guix-home/modules/package-list.scm")))

(load (string-append (getenv "HOME") "/guix-home/modules/emacs.scm"))

(home-environment
 (packages
  (append home-package-list home-emacs-packages))
 (services
  (list
   (simple-service 'dotfiles-service
                   home-files-service-type
                   `((".zshrc"                      ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/zsh/zshrc")))

                     (".config/sway/config"         ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/sway/config")))
                     (".config/sway/colors"         ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/sway/colors")))
                     (".config/sway/wallpapers.png" ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/sway/wallpapers.png")))

                     (".config/mako/config"         ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/mako/config")))

                     (".config/fuzzel/fuzzel.ini"   ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/fuzzel/fuzzel.ini")))

                     (".config/waybar/config"       ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/waybar/config")))
                     (".config/waybar/style.css"    ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/waybar/style.css")))

                     (".config/tmux/tmux.conf"      ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/tmux/tmux.conf")))

                     (".config/starship.toml"       ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/starship/starship.toml")))

		     (".config/bat/themes/mocha.tmTheme"
		      ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/bat/mocha.tmTheme")))

		     (".config/fastfetch/config.jsonc"
		      ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/fastfetch/config.jsonc")))
		     (".config/fastfetch/logo.png"
		      ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/fastfetch/logo.png")))

		     (".config/foot/foot.ini"       ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/foot/foot.ini")))

		     (".config/helix/config.toml"   ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/helix/config.toml")))

		     (".config/ranger/rc.conf"   ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/ranger/rc.conf")))))
   (simple-service 'env-vars-service
                   home-environment-variables-service-type
                   '(("TERM" . "xterm-256color")
                     ("PAGER" . "less")
                     ("COLORTERM" . "truecolor")
                     ("MOZ_ENABLE_WAYLAND" . "1")
                     ("XDG_SESSION_TYPE" . "wayland")
                     ("TERMINAL" . "foot")
                     ("VISUAL" . "emacsclient")
		     ("EDITOR" . "emacsclient")
		     ("BAT_THEME" . "mocha")
		     ("BAT_OPTS" . "-Pp")
		     ("PATH" . "${HOME}/.local/bin:${HOME}/bin${PATH:+:$PATH}")
                     ("XDG_SESSION_DESKTOP" . "sway")
                     ("XDG_CURRENT_DESKTOP" . "sway")))
   (simple-service 'emacs-config-service
                   home-files-service-type
                   `((".emacs.d/init.el" ,home-emacs-config))))))
