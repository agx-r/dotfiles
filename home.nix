{ pkgs, lib, ... }:

{
  home.username = "agx";
  home.homeDirectory = "/home/agx";

  home.stateVersion = "25.05";

  home.packages = [

    # wm
    pkgs.tasks
    pkgs.cosmic-term
    pkgs.cosmic-files
    pkgs.cosmic-reader
    pkgs.wayvnc
    pkgs.wlvncc
    pkgs.cosmic-player
    pkgs.cosmic-ext-calculator
    pkgs.fontconfig
    pkgs.examine
    pkgs.pipewire
    pkgs.gimp
    pkgs.wireplumber
    pkgs.pavucontrol
    pkgs.xdg-utils
    pkgs.wlrctl
    pkgs.wf-recorder
    pkgs.hyprpicker
    pkgs.lswt
    pkgs.imv
    pkgs.kdePackages.dolphin
    # river
    pkgs.river-classic
    pkgs.fuzzel
    pkgs.swaybg
    # cosmic
    pkgs.cosmic-comp
    pkgs.cosmic-osd
    pkgs.cosmic-protocols
    pkgs.cosmic-bg
    pkgs.cosmic-screenshot
    pkgs.cosmic-panel
    pkgs.cosmic-launcher
    # xdg
    pkgs.xdg-desktop-portal-cosmic
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-wlr

    # fonts
    pkgs.iosevka
    pkgs.montserrat

    # ff
    pkgs.ffmpeg

    # base & system
    pkgs.util-linux
    pkgs.ansible
    pkgs.tun2socks
    pkgs.socat
    pkgs.redsocks
    pkgs.pciutils
    pkgs.cdrkit
    pkgs.cloud-utils
    pkgs.proxychains-ng
    pkgs.eza
    pkgs.distrobox
    pkgs.strace
    pkgs.libz
    pkgs.scx.full
    pkgs.minicom
    pkgs.jq
    pkgs.screen
    pkgs.p7zip
    pkgs.iproute2
    pkgs.file
    pkgs.gnupg
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
    pkgs.catgirl
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

    # office
    pkgs.libreoffice-qt-fresh
    pkgs.pandoc

    # android
    pkgs.python313Packages.cryptography
    # pkgs.javaPackages.compiler.openjdk8
    # pkgs.javaPackages.compiler.openjdk11
    # pkgs.javaPackages.compiler.openjdk17
    pkgs.javaPackages.compiler.openjdk21
    # pkgs.javaPackages.compiler.openjdk25
    pkgs.python313Packages.python-magic
    pkgs.androguard
    pkgs.aapt
    pkgs.dex2jar
    pkgs.apktool
    pkgs.jdt-language-server
    pkgs.jadx
    
    # dev common
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
    pkgs.plantuml
    pkgs.graphviz
    pkgs.zeal
    pkgs.gnupatch

    # wasm
    pkgs.wasm-pack
    pkgs.wasm-language-tools

    # terminals, CLI
    pkgs.foot
    pkgs.fish # for nush completions
    pkgs.nushell
    pkgs.powershell
    pkgs.tmux
    pkgs.yt-dlp
    pkgs.bottom
    pkgs.mako
    pkgs.fyi
    pkgs.cava
    pkgs.gping

    # IDEs
    pkgs.helix
    pkgs.emacs

    # networking
    pkgs.tor-browser
    pkgs.floorp-bin
    pkgs.librewolf-unwrapped
    pkgs.chromium
    pkgs.ayugram-desktop
    pkgs.qtpass
    pkgs.thc-hydra

    # multimedia
    pkgs.grim
    pkgs.chafa
    pkgs.libresprite
    pkgs.slurp
    pkgs.waybar
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

    # protocols
    pkgs.protobuf
    pkgs.protols
    pkgs.capnproto
    pkgs.buf
    pkgs.flatbuffers

    # shit
    pkgs.vscode-langservers-extracted
    pkgs.bash-language-server
    pkgs.awk-language-server
    pkgs.yaml-language-server
    # SHITTY SHIT
    pkgs.nodejs_24

    # C
    pkgs.clang-tools
    pkgs.gcc
    pkgs.protobufc
    pkgs.cmake
    pkgs.neocmakelsp
    pkgs.glsl_analyzer
    pkgs.c3c
    pkgs.glibc.dev
    pkgs.musl

    # py
    pkgs.python314
    pkgs.qutebrowser
    pkgs.python314Packages.sexpdata
    pkgs.python313Packages.python-lsp-server

    # just
    pkgs.just
    pkgs.just-lsp

    # julia
    pkgs.julia-lts

    # sml
    pkgs.mlton
    pkgs.smlfmt

    # odin
    pkgs.odin
    pkgs.ols

    # nim
    pkgs.nim-unwrapped
    pkgs.nimlangserver

    # erlang
    pkgs.erlang_28
    pkgs.lfe
    pkgs.erlang-language-platform
    pkgs.beam27Packages.rebar3
    pkgs.beam27Packages.hex
    pkgs.beam27Packages.elixir
    pkgs.beam27Packages.elixir-ls
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
    pkgs.rizin
    pkgs.hexedit
    pkgs.asm-lsp

    # racket
    pkgs.racket

    # koka
    pkgs.koka

    # nix
    pkgs.nixd
    pkgs.nix-prefetch-git

    # zig
    pkgs.zig
    pkgs.zls

    # rust
    pkgs.rustc
    pkgs.cargo
    pkgs.rust-analyzer

    # forth
    # pkgs.gforth

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
    pkgs.netcoredbg
    pkgs.mono
    pkgs.fsharp
    pkgs.fsharp
    pkgs.fable
    pkgs.omnisharp-roslyn
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

    # Clojure
    pkgs.clojure
    pkgs.clojure-lsp
    pkgs.cljfmt

    # Verilog
    pkgs.sv-lang
    pkgs.iverilog # Icarus

    # OCaml
    pkgs.ocaml
    pkgs.dune_3
    pkgs.ocamlPackages.odoc
    pkgs.ocamlPackages.odig
    pkgs.ocamlPackages.utop
    pkgs.why3
    # pkgs.alt-ergo
    pkgs.opam
    pkgs.framac
    pkgs.ocamlPackages.ocaml-lsp
    pkgs.ocamlPackages.findlib
    pkgs.ocamlPackages.ocamlformat

    # ATS
    pkgs.ats2

    # D
    # pkgs.dmd
    pkgs.ldc
    pkgs.serve-d
    pkgs.dfmt

    # emulation
    pkgs.qemu
    pkgs.wineWowPackages.waylandFull
    pkgs.xenia-canary

    # minecraft
    pkgs.prismlauncher-unwrapped

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
    ".config/mimeapps.list".source = ./dotfiles/config/mimeapps.list;
    ".config/xdg-desktop-portal".source = ./dotfiles/config/xdg-desktop-portal;
    ".config/xdg-desktop-portal-wlr".source = ./dotfiles/config/xdg-desktop-portal-wlr;
    ".config/electron-flags.conf".source = ./dotfiles/config/electron-flags.conf;
    ".config/powershell".source = ./dotfiles/config/powershell;
    ".config/containers".source = ./dotfiles/config/containers;
    ".emacs.d/lisp".source = ./dotfiles/config/emacs.d/lisp;
    ".emacs.d/init.el".source = ./dotfiles/config/emacs.d/init.el;
    ".julia/config".source = ./dotfiles/julia/config;
    ".local/share/applications".source = ./dotfiles/share/applications;
    ".XCompose".source = ./dotfiles/config/XCompose;
    ".wallpapers".source = ./dotfiles/wallpapers;
    ".bin".source = ./dotfiles/bin;
    ".ld-preloads".source = ./dotfiles/ld-preloads;
  };

  fonts.fontconfig.enable = true;

  home.activation.copyCosmic = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -rf "$HOME/.config/cosmic"
    mkdir -pv "$HOME/.config/cosmic"
    cp -r ${./dotfiles/config/cosmic}/* "$HOME/.config/cosmic/"
    chmod -R u+rwX "$HOME/.config/cosmic"
  '';

  home.activation.copyQute = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -rf "$HOME/.config/qutebrowser"
    mkdir -pv "$HOME/.config/qutebrowser"
    cp -r ${./dotfiles/config/qutebrowser}/* "$HOME/.config/qutebrowser/"
    chmod -R u+rwX "$HOME/.config/qutebrowser"
  '';

  home.activation.linkFonts = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.fonts
    ln -sf $HOME/.nix-profile/share/fonts/* $HOME/.fonts/
  '';

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vnc
      obs-pipewire-audio-capture
    ];
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 14;
  };
  
  home.sessionVariables = {
    EDITOR = "hx";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  programs.git = {
    enable = true;
    settings.user.name = "agx";
    settings.user.email = "agxr@genocide.fun";
  };

  programs.home-manager.enable = true;
}
