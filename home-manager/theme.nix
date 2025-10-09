{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    papirus-folders
    (catppuccin-kvantum.override {
      accent = "blue";
      variant = "mocha";
    })
  ];

  # Qt theme.
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    kvantum = {
      target = "Kvantum/kvantum.kvconfig";
      text = lib.generators.toINI { } {
        General.theme = "catppuccin-mocha-blue";
      };
    };
  };

  # GTK theme.
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "maroon";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 20;
    };
  };
}
