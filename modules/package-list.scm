(use-modules
  (guix utils)        ; Utilities for package management
  (gnu packages))     ; Package definitions

(map specification->package
     '(
       ;; Window Manager and Core Wayland Utilities
       "swayfx"                    ; Enhanced Wayland compositor
       "xdg-desktop-portal-wlr"    ; XDG desktop portal for Wayland
       "wl-clipboard"              ; Wayland clipboard utilities
       "swaybg"                    ; Wallpaper tool for Sway
       "swayidle"                  ; Idle management for Sway
       "waybar"                    ; Customizable Wayland bar
       "swaylock"                  ; Screen locker for Sway
       "wf-recorder"               ; Screen recording for Wayland

       ;; Desktop Utilities
       "xdg-desktop-portal-gtk"    ; GTK backend for XDG desktop portal
       "brightnessctl"             ; Brightness control utility
       "mako"                      ; Lightweight Wayland notification daemon
       "fyi"                       ; Notification utility
       "fuzzel"                    ; Application launcher
       "grim"                      ; Screenshot utility
       "slurp"                     ; Region selector for Wayland
       "imagemagick"               ; Img editor
       "imv"                       ; Image viewer

       ;; sudo
       "lxqt-sudo"

       ;; For flatpak
       "xdg-utils"                 ; XDG utilities for desktop integration
       "xdg-dbus-proxy"            ; For dbus proxying
       "shared-mime-info"          ; 

       ;; Terminal and Shell Enhancements
       "foot"                      ; Fast Wayland terminal emulator
       "starship"                  ; Customizable shell prompt
       "font-fira-code"            ; Monospaced font for coding
       "font-fira-code-nerd"       ; From agx channel
       "zsh-syntax-highlighting"   ; Syntax highlighting for Zsh
       "tmux"                      ; Terminal multiplexer

       ;; General CLI
       "mosquitto"
       "git"
       "helix"
       "curl"
       "wget"
       "openssh"
       "zip"
       "unzip"
       "agx-screenshot"

       ;; zathura 
       "zathura"
       "zathura-pdf-mupdf"

       ;; File and Search Tools
       "fd"                        ; Fast file finder
       "ripgrep"                   ; Fast grep alternative
       "ranger"                    ; Terminal-based file manager
       "lsd"                       ; Modern ls replacement
       "bat"                       ; Syntax-highlighted cat alternative

       ;; System Monitoring
       "bottom"                    ; System monitor
       "fastfetch"                 ; System information tool

       ;; GUI 
       "qutebrowser"                ; Vim-like browser
       "ungoogled-chromium-wayland" ; Chromium
       "icedove-wayland"            ; Thunderbird
       "librewolf"                  ; Firefox 
       "qbittorrent-enhanced-no-x"  ; Torrent client
       "gnome-themes-extra"         ; Gnome themes

       ;; Audio
       "pipewire"                  ; Audio and video server
       "wireplumber"               ; PipeWire session manager
     ))
