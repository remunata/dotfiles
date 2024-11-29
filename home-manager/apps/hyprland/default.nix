{ inputs, pkgs, ... }:

{
  imports = [
    ./binds.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./rules.nix
    ./settings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
  };
}
