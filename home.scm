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
   (simple-service 'env-vars-service
                   home-environment-variables-service-type
                   '(("TERM" . "xterm-256color")
                     ("PAGER" . "less")
		     ("LESS" . "-iMR")
                     ("COLORTERM" . "truecolor")
                     ("MOZ_ENABLE_WAYLAND" . "1")
                     ("XDG_SESSION_TYPE" . "wayland")
                     ("VISUAL" . "emacsclient")
		     ("EDITOR" . "emacsclient")
		     ("BAT_THEME" . "mocha")
		     ("BAT_OPTS" . "-Pp")
		     ("XDG_DOWNLOAD_DIR" . "${HOME}/downloads")
		     ("PATH" . "${HOME}/.local/bin:${HOME}/bin${PATH:+:$PATH}")
                     ("XDG_SESSION_DESKTOP" . "sway")
                     ("XDG_CURRENT_DESKTOP" . "sway")))
   (simple-service 'dotfiles-service
                   home-files-service-type
                   `((".zshrc"                      ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/zsh/zshrc")))
                     (".zshrc_foot"                 ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/zsh/zshrc_foot")))
                     (".zshrc_tty"                  ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/zsh/zshrc_tty")))

                     (".config/zathura/zathurarc"         ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/zathura/zathurarc")))
                     (".config/zathura/catppuccin-mocha"  ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/zathura/catppuccin-mocha")))

                     (".config/sway/config"         ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/sway/config")))
                     (".config/sway/colors"         ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/sway/colors")))
                     (".config/sway/wallpapers.png" ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/sway/wallpapers.png")))

                     (".config/qutebrowser/config.py"              ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/qutebrowser/config.py")))
                     (".config/qutebrowser/start.html"             ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/qutebrowser/start.html")))
                     (".config/qutebrowser/startpic.jpg"           ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/qutebrowser/startpic.jpg")))
                     (".config/qutebrowser/catppuccin/setup.py"    ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/qutebrowser/catppuccin/setup.py")))
                     (".config/qutebrowser/catppuccin/__init__.py" ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/qutebrowser/catppuccin/__init__.py")))

		     (".encrypted"
		      ,(local-file
			(string-append
			 (getenv "HOME")
			 "/guix-home/encrypted")
			#:recursive? #t))

		     (".icons/default"
		      ,(local-file
			(string-append
			 (getenv "HOME")
			 "/guix-home/dotfiles/cursors")
			#:recursive? #t))

                     (".emacs.d/init.el" ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/emacs/init.el")))
		     (".emacs.d/lisp"
		      ,(local-file
			(string-append
			 (getenv "HOME")
			 "/guix-home/dotfiles/emacs/lisp")
			#:recursive? #t))

                     (".config/mako/config"         ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/mako/config")))

                     (".config/fuzzel/fuzzel.ini"   ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/fuzzel/fuzzel.ini")))
                     (".config/fuzzel/launch-list" ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/fuzzel/launch-list")))
		     (".local/bin/menu.sh"
			,(computed-file "menu.sh"
					#~(begin
					    (copy-file
					    #$(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/fuzzel/menu.sh"))
					    #$output)
					    (chmod #$output #o755))))
		     (".local/bin/ac-on.sh"
			,(computed-file "ac-on.sh"
					#~(begin
					    (copy-file
					    #$(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/fuzzel/ac-on.sh"))
					    #$output)
					    (chmod #$output #o755))))
		     (".local/bin/ac-off.sh"
			,(computed-file "ac-off.sh"
					#~(begin
					    (copy-file
					    #$(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/fuzzel/ac-off.sh"))
					    #$output)
					    (chmod #$output #o755))))

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

		     (".lesskey"   ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/less/lesskey")))

		     (".config/ranger/rc.conf"   ,(local-file (string-append (getenv "HOME") "/guix-home/dotfiles/ranger/rc.conf"))))))))
