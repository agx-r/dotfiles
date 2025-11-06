(run-background "pipewire")
(run-background "wireplumber")
(run-background (string-append (getenv "HOME") ".nix-profile/libexec/xdg-desktop-portal-wlr"))
