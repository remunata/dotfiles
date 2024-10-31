{ pkgs, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = "Mahendra Dinata";
  programs.git.userEmail = "remdinata@gmail.com";
  programs.git.extraConfig = {
    init.defaultBranch = "main";
  };
}


