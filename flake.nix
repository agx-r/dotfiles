{
  description = "agx hm config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixgl, ... }:
  let

    fixOverlay = final: prev: {
      libvdpau-va-gl = prev.libvdpau-va-gl.overrideAttrs (old: {
        cmakeFlags = (old.cmakeFlags or []) ++ [
          "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
        ];
      });

      helix = prev.helix.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          ./dotfiles/patches/helix/zero-based-line-numbers.patch
        ];
      });

      iosevka = prev.iosevka.override {
        privateBuildPlan = builtins.readFile ./dotfiles/config/iosevka/build.toml;
        set = "Custom";
      };

      montserrat = prev.montserrat.overrideAttrs (old: {
        pname = "montserrat-alternates";

        installPhase = ''
          mkdir -p $out/share/fonts/ttf
          mkdir -p $out/share/fonts/otf
          cp -v fonts-alternates/ttf/* $out/share/fonts/ttf/
          cp -v fonts-alternates/otf/* $out/share/fonts/otf/
        '';

        meta = old.meta // { description = "Montserrat Alternates font only"; };
      });
    };

    hostPlatform = "x86_64-linux";
    pkgs = import nixpkgs {
      system = hostPlatform;
      overlays = [
        nixgl.overlay
        fixOverlay
      ];
    };
  in
  {
    homeConfigurations."agx" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home.nix ];
    };
  };
}
