{ pkgs, inputs, ... }:

{
  # Nixpkgs configurations.
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };

  # Firefox.
  programs.firefox.enable = true;

  # Gaming.
  programs = {
    steam.enable = true;
    gamemode.enable = true;
  };

  # Network tray.
  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;

  # System packages.
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    kitty
    pavucontrol
    pamixer
    qimgv
    evince
    
    vscode
    discord

    gamemode
    steam
    heroic
  ];

  # Starship prompt.
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    presets = [
      "nerd-font-symbols"
    ];
  };

  # Font packages.
  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
  ];
}