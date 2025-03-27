{
  description = "My main flakes configuration";

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nixpkgs-zoom,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      zoompkgs = import nixpkgs-zoom {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [ ./nixos/configuration.nix ];
        };
      };
      homeConfigurations = {
        remunata = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit system inputs zoompkgs; };
          modules = [ ./home-manager/home.nix ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim = {
      url = "github:remunata/nvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-zoom.url = "nixpkgs/63dacb46bf939521bdc93981b4cbb7ecb58427a0";
  };
}
