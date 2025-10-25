{ pkgs, ... }:
{
  # Enable zsh as default shell.
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
