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
    pavucontrol
    pamixer
    wl-clipboard

    file-roller
    qimgv
    evince
    mpv
    
    vscode
    discord

    gamemode
    steam
    heroic

    jdk
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
    noto-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    corefonts
    vistafonts
  ];
}
