{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      accent = "blue";
      variant = "macchiato";
    })
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-folders
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
        General.theme = "catppuccin-macchiato-blue";
      };
    };

    qt5ct = {
      target = "qt5ct/qt5ct.conf";
      text = lib.generators.toINI { } {
        Appearance = {
          icon_theme = "Papirus-Dark";
        };
      };
    };

    qt6ct = {
      target = "qt6ct/qt6ct.conf";
      text = lib.generators.toINI { } {
        Appearance = {
          icon_theme = "Papirus-Dark";
        };
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
        accent = "blue";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 20;
    };
    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "macchiato";
      };
      name = "catppuccin-macchiato-blue-standard";
    };
    font = {
      name = "noto sans";
      size = 11;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
