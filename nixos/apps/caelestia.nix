{ pkgs, ... }:
{
  # Caelestia dependencies.
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gtk
    hyprpicker
    cliphist
    inotify-tools
    app2unit
    wireplumber
    trash-cli
    foot
    fish
    jq
    eza
    adw-gtk3
    papirus-icon-theme
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];

  programs.gpu-screen-recorder.enable = true;
}
