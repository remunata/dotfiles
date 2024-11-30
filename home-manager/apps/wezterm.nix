{ inputs, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;

    extraConfig = ''
      return {
        color_scheme = 'Catppuccin Macchiato',
        enable_tab_bar = false,
        window_background_opacity = 0.85,
        default_cursor_style = 'BlinkingBar',
      }
    '';
  };
}
