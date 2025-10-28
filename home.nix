{ config, pkgs, ... }:

{
  home.username = "agx";
  home.homeDirectory = "/home/agx";

  home.stateVersion = "25.05";

  home.packages = [

    # wm
    pkgs.river-classic
    pkgs.pipewire
    pkgs.wireplumber

    # base & system
    pkgs.git
    pkgs.cacert
    pkgs.pass
    pkgs.tree
    pkgs.fd
    pkgs.htop
    pkgs.unzip
    pkgs.zip
    pkgs.light
    pkgs.fastfetch
    pkgs.inxi
    pkgs.dmidecode
    pkgs.mesa
    pkgs.openssh
    pkgs.upower
    pkgs.nixgl.nixGLIntel
    
    # dev common
    pkgs.ghidra-bin
    pkgs.cppcheck
    pkgs.valgrind
    pkgs.gnumake
    pkgs.cmake
    pkgs.gdb
    pkgs.scanmem
    pkgs.lldb
    pkgs.rizin
    pkgs.gcc
    pkgs.gnupatch

    # terminals, CLI
    pkgs.kitty
    pkgs.foot
    pkgs.nushell
    pkgs.tmux
    pkgs.bottom
    pkgs.mako
    pkgs.fyi
    pkgs.fuzzel
    pkgs.cava

    # IDEs
    pkgs.helix
    pkgs.emacs

    # networking
    pkgs.qutebrowser
    pkgs.floorp-bin
    pkgs.ayugram-desktop
    pkgs.qtpass
    pkgs.thc-hydra

    # multimedia
    pkgs.grim
    pkgs.slurp
    pkgs.waybar
    pkgs.swaybg
    pkgs.imagemagick
    pkgs.wl-clipboard
    pkgs.swayidle
    pkgs.helvum
    pkgs.oreo-cursors-plus
    
    # file management
    pkgs.marksman
    pkgs.zathura
    pkgs.texliveFull
    pkgs.texlab
    pkgs.xfce.thunar

    # electronics
    pkgs.wchisp
    pkgs.sdcc

    # PLs
    # random
    pkgs.tokei
    pkgs.python314
    pkgs.rocmPackages.clang
    pkgs.nodejs_24

    # just
    pkgs.just
    pkgs.just-lsp

    # nim
    pkgs.nim-unwrapped
    pkgs.nimlangserver

    # BEAM
    # erlang
    pkgs.erlang_28
    pkgs.beam27Packages.rebar3
    pkgs.beam27Packages.hex

    # elixir
    pkgs.beam27Packages.elixir
    pkgs.beam27Packages.elixir-ls

    # gleam
    pkgs.gleam

    # asm
    pkgs.fasm
    pkgs.nasm
    pkgs.asm-lsp

    # racket
    pkgs.racket

    # koka
    pkgs.koka

    # nix
    pkgs.nil

    # zig
    pkgs.zig
    pkgs.zls

    # rust
    pkgs.rustc
    pkgs.cargo
    pkgs.rust-analyzer

    # forth
    pkgs.gforth
    pkgs.factor-lang

    # metamath
    pkgs.metamath

    # ada
    pkgs.ada

    # idris2
    pkgs.idris2Packages.idris2Lsp
    pkgs.idris2

    # elm
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-language-server

    # lean 4
    pkgs.lean4

    # dotnet
    pkgs.fstar

    # coq
    pkgs.coq

    # scheme
    pkgs.guile

    # OCaml
    pkgs.ocaml
    pkgs.opam
    pkgs.framac
    pkgs.ocamlPackages.lsp

    # emulation
    pkgs.qemu
    pkgs.wineWowPackages.waylandFull

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/helix".source = ./dotfiles/config/helix;
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
    ".config/gtk-3.0".source = ./dotfiles/config/gtk-3.0;
    ".config/gtk-4.0".source = ./dotfiles/config/gtk-4.0;
    ".config/gforthrc".source = ./dotfiles/config/gforthrc;
    ".XCompose".source = ./dotfiles/config/XCompose;
    ".wallpapers".source = ./dotfiles/wallpapers;
    ".bin".source = ./dotfiles/bin;
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 14;
  };
  
  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
}
