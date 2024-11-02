{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "JetBrainsMono Nerd Font";
    };
    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 10;
    };
  };
}
