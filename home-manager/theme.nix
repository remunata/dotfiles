{ pkgs, ... }:

{
  # Qt theme.
  qt = {
    enable = true;
    platformTheme.name = "gtk";
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

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
