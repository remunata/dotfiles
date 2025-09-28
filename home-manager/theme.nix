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
  gtk.enable = true;
}
