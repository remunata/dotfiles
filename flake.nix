{
  description = "Configurations of remnix";

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
	specialArgs = {
	  inherit system;
	  inherit inputs;
	};
	modules = [ ./system/configuration.nix ];
      };
    };
    homeConfigurations = {
      remunata = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
	extraSpecialArgs = {
	  inherit system;
	  inherit inputs;
	};
	modules = [ ./user/home.nix ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    ags.url = "github:Aylur/ags";
    matugen.url = "github:InioX/matugen?ref=v2.2.0";

    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
