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
      services = {
        audioIncrement = 0.05;
        useFahrenheit = false;
      };
      session = {
        commands.logout = [
          "hyprctl"
          "dispatch"
          "exit"
          "0"
        ];
      };
      notifs = {
        actionOnClick = true;
      };
    };
    cli = {
      enable = true;
    };
  };
}
