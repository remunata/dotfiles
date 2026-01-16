{ pkgs, ... }:

{
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;

    environment = {
      XDG_CURRENT_DESKTOP = "niri";
      QT_QPA_PLATFORN = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
      DISPLAY = null;
    };

    cursor = {
      theme = "Bibata-Modern-Classic";
      size = 20;
    };
  };

  home.packages = with pkgs; [
    bibata-cursors
    (pkgs.catppuccin-papirus-folders.override {
      flavor = "mocha";
      accent = "sapphire";
    })
  ];
}
