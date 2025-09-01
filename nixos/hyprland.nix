{ inputs, pkgs, ... }:

let
  sddm-bg = pkgs.fetchurl {
    url = "https://www.desktophut.com/files/oA5LA5QU3UCjLhA_arlecchino-the-knave-genshin-impact.3840x2160.mp4";
    hash = "sha256-tYB8vlvG7qdcWCTfRV7rnhzTSngJElUieN8IOsYweBY=";
  };
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "rei";
    extraBackgrounds = [ sddm-bg ];
    theme-overrides = {
      "LoginScreen.LoginArea.Avatar" = {
        shape = "circle";
      };
      LoginScreen = {
        background = "${sddm-bg.name}";
      };
      LockScreen = {
        background = "${sddm-bg.name}";
      };
    };
  };
in
{
  # Hyprland.
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # SDDM login manager.
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = sddm-theme.pname;
    extraPackages = sddm-theme.propagatedBuildInputs;
    settings = {
      # required for styling the virtual keyboard
      General = {
        GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };

  # Dependencies.
  environment.systemPackages = with pkgs; [
    sddm-theme
    sddm-theme.test
    lxqt.lxqt-policykit
    libsForQt5.qt5.qtgraphicaleffects
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  # Thunar file manager.
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    xfconf.enable = true;
  };

  # Thunar functionalities.
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
