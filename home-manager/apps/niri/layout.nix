{
  programs.niri.settings.layout = {
    preset-column-widths = [
      { proportion = 0.5; }
      { proportion = 0.75; }
      { proportion = 1.; }
    ];

    preset-window-heights = [
      { proportion = 0.5; }
      { proportion = 1.; }
    ];

    default-column-width = {
      proportion = 0.5;
    };

    gaps = 12;
    background-color = "transparent";
  };

  programs.niri.settings.layer-rules = [
    {
      matches = [ { namespace = "^quickshell$"; } ];
      place-within-backdrop = true;
    }
  ];
}
