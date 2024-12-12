{ pkgs, config, ... }:
let
  aliases = {
    "l" = "ls -l";
    "ll" = "ls -la";
    "vim" = "nvim";
    "vi" = "nvim";
    "q" = "exit";
    "c" = "clear";
    "gst" = "git status";
    "ga" = "git add";
    "gcmsg" = "git commit -m";
    "gp" = "git push";
  };

in {
  # Zsh configurations.
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = aliases;

    history = {
      size = 5000;
      save = 5000;
      append = true;
      ignoreAllDups = true;
      path = "${config.xdg.dataHome}/.zsh-history";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
    ];
  };

  # Awesome zoxide for better cd.
  programs.zoxide = {
    enable = true;
    options = [
      "--cmd cd"
    ];
  };

  # Fuzzy finder for shell.
  programs.fzf.enable = true;

  # Bash configurations.
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = aliases;
  };

  # Direnv.
  programs.direnv = {
    enable = true;
    silent = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
