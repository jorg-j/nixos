{ config, pkgs, ... }:

{
  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "23.05";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "docker-compose" "docker" "git" ];
      theme = "afowler";
      # theme = "dst";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';
  };


}