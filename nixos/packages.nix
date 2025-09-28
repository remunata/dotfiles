{ pkgs, ... }:

{
  # Nixpkgs configurations.
  nixpkgs = {
    config.allowUnfree = true;
  };

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
}
