{ config, pkgs, ... }:

{
  home.username = "agx";
  home.homeDirectory = "/home/agx";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.helix
    pkgs.ayugram-desktop
    pkgs.git
    pkgs.pass
    pkgs.kitty
    pkgs.floorp-bin
    pkgs.zathura
    pkgs.nushell
    pkgs.emacs
    pkgs.tmux
    pkgs.mako
    pkgs.mesa
    pkgs.fuzzel
    pkgs.grim
    pkgs.slurp
    pkgs.waybar
    pkgs.bottom
    pkgs.swaybg
    pkgs.qtpass
    pkgs.cava
    pkgs.fd
    pkgs.htop
    pkgs.swaylock
    pkgs.light
    pkgs.fyi

    pkgs.imagemagick

    pkgs.foot

    pkgs.texliveFull

    pkgs.xfce.thunar

    pkgs.qutebrowser

    pkgs.qemu

    pkgs.fastfetch
    pkgs.inxi
    pkgs.dmidecode

    pkgs.thc-hydra

    pkgs.guile

    pkgs.elmPackages.elm
    pkgs.idris2
    pkgs.lean4
    pkgs.fstar
    pkgs.coq

    pkgs.ocaml
    pkgs.opam

    pkgs.rocmPackages.clang
    pkgs.valgrind
    pkgs.framac
    pkgs.gnumake
    pkgs.cmake
    pkgs.gdb
    pkgs.radare2
    pkgs.fasm

    pkgs.nim-unwrapped

    pkgs.zig

    pkgs.python314

    pkgs.wineWowPackages.waylandFull
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/helix/config.toml".source = ./dotfiles/config/helix/config.toml;
    ".config/fastfetch/config.jsonc".source = ./dotfiles/config/fastfetch/config.jsonc;
    ".config/wayfire.ini".source = ./dotfiles/config/wayfire.ini;
    ".config/foot/foot.ini".source = ./dotfiles/config/foot/foot.ini;
    ".config/nushell/config.nu".source = ./dotfiles/config/nushell/config.nu;
    ".config/fuzzel/fuzzel.ini".source = ./dotfiles/config/fuzzel/fuzzel.ini;
    ".config/zathura".source = ./dotfiles/config/zathura;
    ".config/tmux/tmux.conf".source = ./dotfiles/config/tmux/tmux.conf;
    ".config/river".source = ./dotfiles/config/river;
    ".config/waybar".source = ./dotfiles/config/waybar;
    ".config/swaylock".source = ./dotfiles/config/swaylock;
    ".config/mako".source = ./dotfiles/config/mako;

    ".wallpapers".source = ./dotfiles/wallpapers;

    ".bin".source = ./dotfiles/bin;

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/agx/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
    # XDG_SESSION_TYPE = "wayland";
    # XDG_CURRENT_DESKTOP = "wayfire";
  };

  programs.home-manager.enable = true;
}
