(run-background (string-append (getenv "HOME") "/.nix-profile/libexec/xdg-desktop-portal"))
(run-background (string-append (getenv "HOME") "/.nix-profile/libexec/xdg-desktop-portal-gtk"))
(run-background (string-append (getenv "HOME") "/.nix-profile/libexec/xdg-desktop-portal-wlr"))
(run-background "dbus-update-activation-environment --all")
