{
  pkgs,
  inputs,
  system,
  ...
}:

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
    inputs.nvim.packages.${system}.nvim
    inputs.zen-browser.packages.${system}.twilight
    wget
    git
    pavucontrol
    pamixer
    sof-firmware
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
    linuxPackages.xone

    jdk
    devenv
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
