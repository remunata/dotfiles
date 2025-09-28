{ inputs, ... }:
let
  wallpapers = builtins.path {
    path = ../images/wallpapers;
  };
in
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false;
    };
    settings = {
      paths.wallpaperDir = wallpapers;
    };
    cli = {
      enable = true;
    };
  };
}
