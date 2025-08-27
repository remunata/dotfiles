{ inputs, pkgs, ... }:

let
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "rei";
    theme-overrides = {
      "LoginScreen.LoginArea.Avatar" = {
        shape = "circle";
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
