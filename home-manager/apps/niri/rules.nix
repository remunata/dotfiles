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
      open-maximized = true;
    }
    {
      matches = [ { app-id = "wezterm"; } ];
      opacity = 0.8;
      draw-border-with-background = false;
    }
    {
      matches = [
        { app-id = "quickshell"; }
        { app-id = "pavucontrol"; }
      ];
      open-floating = true;
    }
    {
      matches = [
        { app-id = "thunar"; }
        { app-id = "qimgv"; }
        { app-id = "org.gnome.Evince"; }
      ];
      open-maximized = false;
    }
  ];
}
