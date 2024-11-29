{ ... }:
let
  wallpaper = builtins.path {
    path = ../../wallpapers/black_shore.jpg;
  };
  image = builtins.path {
    path = ../../wallpapers/jinhsi.jpg;
  };
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = "";
        path = "${wallpaper}";
        blur_passes = 2;
      };
      
      image = {
        path = "${image}";
        size = 150;
        rounding = -1;
        position = "0, 150";
        halign = "center";
        valign = "center";
      };

      input-field = [
        {
          monitor = "";
          size = "350, 50";
          dots_size = "0.1";
          dots_spacing = "0.5";
          outline_thickness = 3;
          inner_color = "#24273a";
          outer_color = "#7dc4e4";
          font_color = "#cad3f5";
          fade_on_empty = true;
          position = "0, 15";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Time
        {
          text = "cmd[update:200] date +'%r'";
          color = "#cad3f5";
          font_size = 30;

          halign = "center";
          valign = "center";
          position = "0, -60";
        }
        # Date
        {
          text = "cmd[update:1000] date +'%a, %x'";
          color = "#cad3f5";
          font_size = 20;

          halign = "center";
          valign = "center";
          position = "0, -120";
        }
      ];
    };
  };
}
