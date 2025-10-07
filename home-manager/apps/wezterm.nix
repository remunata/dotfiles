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

      -- Helper functions
      -- Check if file exists
      local function file_exists(path)
        local f = io.open(path, "r")
        if f then
          f:close()
          return true
        end
        return false
      end

      -- Parse key=value pairs into a table
      local function parse_colors(filename)
        local colours = {}
        for line in io.lines(filename) do
          local key, value = line:match("%$([%w_]+)%s*=%s*([%x]+)")
          if key and value then
            colours[key] = "#" .. value:lower()
          end
        end
        return colours
      end

      -- Caelestia color scheme for hyprland
      local hypr_scheme_path = "${config.home.homeDirectory}/.config/hypr/scheme/"
      local colours

      -- Use default colorscheme if there's no current config
      if not file_exists(hypr_scheme_path .. "current.conf") then
        colours = parse_colors(hypr_scheme_path .. "default.conf")
      else
        colours = parse_colors(hypr_scheme_path .. "current.conf")
      end

      -- Set terminal colors based on the hyprland scheme
      config.colors = {
        foreground = colours["onSurface"],
        background = colours["surface"],
        cursor_bg = colours["secondary"],
        selection_bg = colours["secondary"],

        ansi = {
          colours["term0"],
          colours["term1"],
          colours["term2"],
          colours["term3"],
          colours["term4"],
          colours["term5"],
          colours["term6"],
          colours["term7"],
        },

        brights = {
          colours["term8"],
          colours["term9"],
          colours["term10"],
          colours["term11"],
          colours["term12"],
          colours["term13"],
          colours["term14"],
          colours["term15"],
        },
      }


      -- Add hypr scheme config to the wezterm watchlist
      wezterm.add_to_config_reload_watch_list(hypr_scheme_path .. "current.conf")

      -- Return config
      return config
    '';
  };
}
