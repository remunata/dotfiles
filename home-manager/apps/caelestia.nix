{ ... }:
let
  wallpapers = builtins.path {
    path = ../images/wallpapers;
  };
in
{
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
