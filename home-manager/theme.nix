{ pkgs, ... }:

{
  home.packages = with pkgs; [
    papirus-folders
  ];

  # Qt theme.
  qt = {
    enable = true;
    platformTheme.name = "qtct";
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
