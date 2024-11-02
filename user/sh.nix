{ pkgs, ... }:
let
  aliases = {
    l = "ls -l";
    ll = "ls -la";
    vim = "nvim";
    q = "exit";
    c = "clear";
  };
in {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = aliases;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = aliases;
  };
}
