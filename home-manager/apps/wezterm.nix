{ config, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = wezterm.config_builder()

      -- Font config
      config.font = wezterm.font 'JetBrainsMono Nerd Font'
      config.font_size = 13

      -- Window config
      config.enable_tab_bar = false
      config.window_padding = {
        left = 25,
        right = 25,
        top = 15,
        bottom = 15,
      }

      config.color_scheme = 'terafox'

      -- Event listener to dynamicall change padding
      wezterm.on('user-var-changed', function(window, pane, name, value)
        if name == "is_nvim" then
          local overrides = window:get_config_overrides() or {}
          if value == "0" then
            -- Set padding to 0 when entering Neovim
            overrides.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
          else
            -- Restore default padding when leaving
            overrides.window_padding = nil
          end
          window:set_config_overrides(overrides)
        end
      end)

      -- Return config
      return config
    '';
  };
}
