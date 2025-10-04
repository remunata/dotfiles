{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = wezterm.config_builder() 

      config.font = wezterm.font 'JetBrainsMono Nerd Font'
      config.font_size = 13

      config.color_scheme = 'tokyonight_night'

      config.enable_tab_bar = false
      config.window_padding = {
        left = 25,
        right = 25,
        top = 15,
        bottom = 15,
      }

      return config
    '';
  };
}
