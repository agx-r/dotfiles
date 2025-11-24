(run-background (string-append "nixGLIntel "(getenv "HOME") "/.nix-profile/libexec/xdg-desktop-portal-wlr"))
(run-background (string-append "nixGLIntel "(getenv "HOME") "/.nix-profile/libexec/xdg-desktop-portal-gtk"))
(run-background (string-append "nixGLIntel " (getenv "HOME") "/.nix-profile/libexec/xdg-desktop-portal"))
(run-background "dbus-update-activation-environment --all")
