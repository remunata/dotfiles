{
  programs.niri.settings.window-rules = [
    {
      opacity = 0.95;
      geometry-corner-radius = {
        bottom-left = 12.;
        bottom-right = 12.;
        top-left = 12.;
        top-right = 12.;
      };
      clip-to-geometry = true;
    }
    {
      matches = [ { app-id = "r#\"^org\.gnome\.\"#"; } ];
      draw-border-with-background = false;
      geometry-corner-radius = {
        bottom-left = 12.;
        bottom-right = 12.;
        top-left = 12.;
        top-right = 12.;
      };
      clip-to-geometry = true;
    }
    {
      matches = [ { app-id = "wezterm"; } ];
      opacity = 0.8;
      draw-border-with-background = false;
      open-maximized = true;
    }
    {
      matches = [ { app-id = "quickshell"; } ];
      open-floating = true;
    }
    {
      matches = [
        { app-id = "vivaldi"; }
        { app-id = "libreoffice"; }
      ];
      open-maximized = true;
    }
  ];
}
