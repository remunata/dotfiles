{
  inputs,
  pkgs,
  system,
  ...
}:
let
  sddm-bg = pkgs.fetchurl {
    url = "https://www.desktophut.com/files/oA5LA5QU3UCjLhA_arlecchino-the-knave-genshin-impact.3840x2160.mp4";
    hash = "sha256-tYB8vlvG7qdcWCTfRV7rnhzTSngJElUieN8IOsYweBY=";
  };
  sddm-theme = inputs.silentSDDM.packages.${system}.default.override {
    theme = "rei";
    extraBackgrounds = [ sddm-bg ];
    theme-overrides = {
      "LoginScreen.LoginArea.Avatar" = {
        shape = "circle";
      };
      LockScreen = {
        background = "${sddm-bg.name}";
      };
      General = {
        "animated-background-placeholder" = "";
      };
    };
  };
in
{
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

  # Service to make avatar picture avaailable before sddm actually starts.
  systemd.services."sddm-avatar" = {
    description = "Service to copy or update users Avatars at startup.";
    wantedBy = [ "multi-user.target" ];
    before = [ "sddm.service" ];
    script = ''
      for user in /home/*; do

        username=$(basename "$user")
        icon_source="$user/.face.icon"
        icon_dest="/var/lib/AccountsService/icons/$username"

        if [ -f "$icon_source" ]; then
          if [ ! -f "$icon_dest" ] || ! cmp -s "$icon_source" "$icon_dest"; then
            rm -f "$icon_dest"
            cp -L "$icon_source" "$icon_dest"
          fi
        fi

      done
    '';
    serviceConfig = {
      Type = "simple";
      User = "root";
      StandardOutput = "journal+console";
      StandardError = "journal+console";
    };
  };

  # Dependencies.
  environment.systemPackages = [
    sddm-theme
    sddm-theme.test
  ];

  # Ensures SDDM starts after the service.
  systemd.services.sddm = {
    after = [ "sddm-avatar.service" ];
  };

}
