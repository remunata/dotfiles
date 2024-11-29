{ config, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font 10";
        follow = "mouse";
        indicate_hidden = "yes";
        offset = "10x10";
        notification_height = 0;
        seperator_height = 2;
        width = 350;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 2;
        frame_color = "#85c1dc";
        transparency = 10;
        seperator_color = "frame";

        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = "yes";
        stack_duplicates = true;
        hide_duplicate_count = false;

        show_indicators = "yes";

        corner_radius = 10;
        timeout = 5;
      };

      urgency_low = {
        background = "#232634";
        foreground = "#BABBF1";
      };

      urgency_normal = {
        background = "#232634";
        foreground = "#BABBF1";
      };

      urgency_critical = {
        background = "#232634";
        foreground = "#BABBF1";
        frame_color = "#ea999c";
      };
    };
  };
}
