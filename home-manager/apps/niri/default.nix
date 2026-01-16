{ inputs, pkgs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
    ./binds.nix
    ./input.nix
    ./layout.nix
    ./rules.nix
    ./settings.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
