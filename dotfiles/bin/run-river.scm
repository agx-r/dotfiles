#!/usr/bin/env guile
!#
(use-modules (ice-9 rdelim))

(setenv "TERM" "foot")
(setenv "TERMINAL" "foot")
(setenv "EDITOR" "hx")
(setenv "BROWSER" "floorp")
(setenv "XDG_CURRENT_DESKTOP" "river")
(setenv "DESKTOP_SESSION" "river")
(setenv "MOZ_ENABLE_WAYLAND" "1")
(setenv "QT_QPA_PLATFORM" "wayland")
(setenv "CLUTTER_BACKEND" "wayland")
(setenv "LANG" "C.UTF-8")
(setenv "LC_ALL" "C.UTF-8")

(system* "dbus-run-session" "nixVulkanIntel" "river" "-no-xwayland")
