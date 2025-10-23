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
    system = "x86_64-linux";

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
    };

    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        nixgl.overlay
        fixOverlay
      ];
    };
  in {
    homeConfigurations."agx" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home.nix ];
    };
  };
}
