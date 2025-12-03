{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "discord"
      "postman"
      "obsidian"
      "steam"
      "steam-unwrapped"
      "corefonts"
      "vista-fonts"
      "vivaldi"
    ];

  # System utilites.
  environment.systemPackages = with pkgs; [
    wget
    git
    killall
    wl-clipboard

    pavucontrol
    pamixer

    file-roller
    sof-firmware

    devenv
    compose2nix
  ];

  # Docker.
  virtualisation.docker = {
    enable = true;
  };

  # Font packages.
  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    corefonts
    vistafonts
  ];

  # Enable flatpak.
  services.flatpak.enable = true;
}
