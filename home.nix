{ pkgs, ... }:

{
  home.username = "agx";
  home.homeDirectory = "/home/agx";

  home.stateVersion = "25.05";

  home.packages = [

    # wm
    pkgs.river-classic
    pkgs.pipewire
    pkgs.wireplumber
    pkgs.xdg-desktop-portal-wlr
    pkgs.wf-recorder
    pkgs.lswt

    # fonts
    pkgs.iosevka
    pkgs.nerd-fonts.iosevka-term-slab

    # ff
    pkgs.ffmpeg

    # base & system
    pkgs.util-linux
    pkgs.p7zip
    pkgs.file
    pkgs.gnupg
    pkgs.pandoc
    pkgs.hexdump
    pkgs.unixtools.xxd
    pkgs.uutils-coreutils-noprefix
    pkgs.ripgrep
    pkgs.git
    pkgs.doxygen
    pkgs.gzip
    pkgs.cacert
    pkgs.pass
    pkgs.tree
    pkgs.fd
    pkgs.htop
    pkgs.unzip
    pkgs.zip
    pkgs.light
    pkgs.fastfetch
    pkgs.onefetch
    pkgs.inxi
    pkgs.dmidecode
    pkgs.mesa
    pkgs.openssh
    pkgs.upower
    pkgs.nixgl.nixGLIntel
    pkgs.nixgl.nixVulkanIntel

    # android
    pkgs.python313Packages.cryptography
    pkgs.javaPackages.compiler.openjdk17
    pkgs.python313Packages.python-magic
    pkgs.androguard
    pkgs.aapt
    pkgs.dex2jar
    pkgs.jadx
    
    # dev common
    pkgs.wasm-pack
    pkgs.tokei
    pkgs.automake
    pkgs.autoconf
    pkgs.ghidra-bin
    pkgs.cppcheck
    pkgs.valgrind
    pkgs.gnumake
    pkgs.gdb
    pkgs.scanmem
    pkgs.lldb
    pkgs.rizin
    pkgs.funnelweb
    pkgs.plantuml
    pkgs.graphviz
    pkgs.why3
    pkgs.zeal
    pkgs.gnupatch

    # terminals, CLI
    pkgs.foot
    pkgs.fish # for nush completions
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
    
    # file management
    pkgs.marksman
    pkgs.zathura
    pkgs.texliveFull
    pkgs.texlab

    # electronics
    pkgs.wchisp
    pkgs.sdcc

    # PLs
    # shit
    pkgs.nodejs_24

    # C
    pkgs.clang-tools
    pkgs.gcc
    pkgs.cmake

    # py
    pkgs.python314

    # just
    pkgs.just
    pkgs.just-lsp

    # julia
    pkgs.julia-lts

    # odin
    pkgs.odin
    pkgs.ols

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

    # haskell
    pkgs.haskell-language-server
    pkgs.haskell.compiler.ghc98
    pkgs.haskellPackages.cabal-install
    pkgs.haskellPackages.hoogle
    pkgs.haskellPackages.hspec
    pkgs.haskellPackages.QuickCheck
    pkgs.stack
    pkgs.cabal2nix

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
    pkgs.nix-prefetch-git

    # zig
    pkgs.zig
    pkgs.zls

    # rust
    pkgs.rustc
    pkgs.cargo
    pkgs.rust-analyzer

    # forth
    pkgs.gforth

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

    # pony
    pkgs.ponyc

    # scheme
    pkgs.guile
    pkgs.guile-zlib
    pkgs.guile-json
    pkgs.guile-mqtt

    # toml
    pkgs.taplo

    # OCaml
    pkgs.ocaml
    # pkgs.alt-ergo
    pkgs.opam
    pkgs.framac
    pkgs.ocamlPackages.lsp

    # emulation
    pkgs.qemu
    pkgs.wineWowPackages.waylandFull

  ];

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
    ".julia/config".source = ./dotfiles/julia/config;
  };

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 14;
  };
  
  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.git = {
    enable = true;
    settings.user.name = "agx";
    settings.user.email = "agxr@genocide.fun";
  };

  programs.home-manager.enable = true;
}
