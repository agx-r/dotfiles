(use-modules
 (gnu home)
 (gnu home services)
 (gnu packages)
 (gnu services)
 (guix gexp)
 (guix utils))

;; Define base path for dotfiles
(define home-dir (getenv "HOME"))
(define dotfiles-dir (string-append home-dir "/guix-home/dotfiles"))
(define modules-dir (string-append home-dir "/guix-home/modules"))
(define encrypted-dir (string-append home-dir "/guix-home/encrypted"))

;; Load package and Emacs configurations
(define home-package-list
  (load (string-append modules-dir "/package-list.scm")))
(load (string-append modules-dir "/emacs.scm"))

(define (dotfile path)
  "Helper to create a local-file from dotfiles directory."
  (local-file (string-append dotfiles-dir "/" path)))

(define (recursive-dotfile path)
  "Helper for recursive local-file from dotfiles directory."
  (local-file (string-append dotfiles-dir "/" path) #:recursive? #t))

(define (script-file name source-path)
  "Helper to create executable script files."
  (computed-file
   name
   #~(begin
       (copy-file #$(dotfile source-path) #$output)
       (chmod #$output #o755))))

(home-environment
 (packages
  (append home-package-list home-emacs-packages))
 (services
  (list
   ;; Environment variables
   (simple-service
    'env-vars-service
    home-environment-variables-service-type
    '(("TERM" . "xterm-256color")
      ("LC_COLLATE" . "C")
      ("PAGER" . "less")
      ("LESS" . "-iMR")
      ("EDITOR" . "emacsclient")
      ("VISUAL" . "emacsclient")
      ("BROWSER" . "qutebrowser")
      ("VIDEO" . "mpv")
      ("IMAGE" . "imv")
      ("COLORTERM" . "truecolor")
      ("OPENER" . "xdg-open")
      ("BAT_THEME" . "mocha")

      ("PASSWORD_STORE_DIR" . "$HOME/.password-store")
      ("XDG_DOWNLOAD_DIR" . "${HOME}/downloads")
      ("STARSHIP_CONFIG" . "${HOME}/.config/starship/starship.toml")
      ("STARSHIP_CACHE" . "$XDG_CACHE_HOME/starship/cache")
      ("PATH" . "${HOME}/.local/bin:${HOME}/bin${PATH:+:$PATH}")

      ("MOZ_ENABLE_WAYLAND" . "1")
      ("QT_WAYLAND_DISABLE_WINDOWDECORATION" . "1")
      ("XDG_SESSION_TYPE" . "wayland")
      ("RTC_USE_PIPEWIRE" . "true")
      ("SDL_VIDEODRIVER" . "wayland")
      ("_JAVA_AWT_WM_NONREPARENTING" . "1")
      ("XDG_SESSION_DESKTOP" . "sway")
      ("XDG_CURRENT_DESKTOP" . "sway")))
   
   ;; Dotfiles
   (simple-service
    'dotfiles-service
    home-files-service-type
    `(;; Zsh configuration
      (".zshrc" ,(dotfile "zsh/zshrc"))
      (".zshrc_foot" ,(dotfile "zsh/zshrc_foot"))
      (".zshrc_tty" ,(dotfile "zsh/zshrc_tty"))
      
      ;; Zathura configuration
      (".config/zathura/zathurarc" ,(dotfile "zathura/zathurarc"))
      (".config/zathura/catppuccin-mocha" ,(dotfile "zathura/catppuccin-mocha"))
      
      ;; Sway configuration
      (".config/sway/config" ,(dotfile "sway/config"))
      (".config/sway/colors" ,(dotfile "sway/colors"))
      (".config/sway/wallpapers.png" ,(dotfile "sway/wallpapers.png"))
      
      ;; Qutebrowser configuration
      (".config/qutebrowser/config.py" ,(dotfile "qutebrowser/config.py"))
      (".config/qutebrowser/start.html" ,(dotfile "qutebrowser/start.html"))
      (".config/qutebrowser/startpic.jpg" ,(dotfile "qutebrowser/startpic.jpg"))
      (".config/qutebrowser/catppuccin/setup.py" ,(dotfile "qutebrowser/catppuccin/setup.py"))
      (".config/qutebrowser/catppuccin/__init__.py" ,(dotfile "qutebrowser/catppuccin/__init__.py"))
      
      ;; Encrypted directory
      (".encrypted" ,(local-file encrypted-dir #:recursive? #t))
      
      ;; Cursor icons
      (".icons/default" ,(recursive-dotfile "cursors"))
      
      ;; Emacs configuration
      (".emacs.d/init.el" ,(dotfile "emacs/init.el"))
      (".emacs.d/lisp" ,(recursive-dotfile "emacs/lisp"))
      
      ;; Mako notification daemon
      (".config/mako/config" ,(dotfile "mako/config"))
      
      ;; Fuzzel launcher
      (".config/fuzzel/fuzzel.ini" ,(dotfile "fuzzel/fuzzel.ini"))
      (".config/fuzzel/launch-list" ,(dotfile "fuzzel/launch-list"))
      
      ;; Executable scripts
      (".local/bin/menu.sh" ,(script-file "menu.sh" "fuzzel/menu.sh"))
      (".local/bin/ac-on.sh" ,(script-file "ac-on.sh" "fuzzel/ac-on.sh"))
      (".local/bin/ac-off.sh" ,(script-file "ac-off.sh" "fuzzel/ac-off.sh"))
      
      ;; Waybar configuration
      (".config/waybar/config" ,(dotfile "waybar/config"))
      (".config/waybar/style.css" ,(dotfile "waybar/style.css"))
      
      ;; Tmux configuration
      (".config/tmux/tmux.conf" ,(dotfile "tmux/tmux.conf"))
      
      ;; Starship prompt
      (".config/starship/starship.toml" ,(dotfile "starship/starship.toml"))
      
      ;; Bat theme
      (".config/bat/themes/mocha.tmTheme" ,(dotfile "bat/mocha.tmTheme"))
      
      ;; Fastfetch configuration
      (".config/fastfetch/config.jsonc" ,(dotfile "fastfetch/config.jsonc"))
      (".config/fastfetch/logo.png" ,(dotfile "fastfetch/logo.png"))
      
      ;; Foot terminal
      (".config/foot/foot.ini" ,(dotfile "foot/foot.ini"))
      
      ;; Helix editor
      (".config/helix/config.toml" ,(dotfile "helix/config.toml"))
      
      ;; Less key bindings
      (".lesskey" ,(dotfile "less/lesskey"))
      
      ;; Ranger file manager
      (".config/ranger/rc.conf" ,(dotfile "ranger/rc.conf")))))))
