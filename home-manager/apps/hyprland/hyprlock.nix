{ ... }:
let
  wallpaper = builtins.path {
    path = ../../wallpapers/frieren.jpg;
  };
  image = builtins.path {
    path = ../../wallpapers/mumei.png;
  };
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = "";
        path = "${wallpaper}";
        blur_passes = 1;
        contrast = 1;
        brightness = 0.5;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };

      general = {
        grace = 0;
        no_fade_in = false;
        disable_loading_bar = true;
      };
      
      image = {
        path = "${image}";
        border_color = "0xffdddddd";
        border_size = 0;
        size = 73;
        rounding = -1;
        position = "0, -384";
        halign = "center";
        valign = "center";
      };

      input-field = [
        {
          monitor = "";
          size = "300, 30";
          outline_thickness = 0;
          dots_size = 0.25;
          dots_spacing = 0.55;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgba(242, 243, 244, 0)";
          inner_color = "rgba(242, 243, 244, 0)";
          font_color = "rgba(242, 243, 244, 0.75)";
          fade_on_empty = false;
          placeholder_text = "";
          hide_input = false;
          check_color = "rgba(204, 136, 34, 0)";
          fail_color = "rgba(204, 34, 34, 0)";
          fail_text = "$FAIL <b>($ATTEMPTS)</b>";
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;
          position = "0, -468";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Hour-Time
        {
          text = "cmd[update:1000] date +'%k:%M'";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 93;
          font_family = "JetBrains Mono Extrabold";
          halign = "center";
          valign = "center";
          position = "0, 310";
        }
        # Date
        {
          text = "cmd[update:1000] date +'%A, %B %d'";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 20;
          font_family = "JetBrains Mono";
          halign = "center";
          valign = "center";
          position = "0, 405";
        }
        # Username
        {
          text = "Hi, Remunata!";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 12;
          font_family = "JetBrains Mono";
          position = "0, -438";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
