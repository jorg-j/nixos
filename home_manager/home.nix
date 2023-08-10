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
      # theme = "afowler";
      theme = "agnoster";
      # theme = "dst";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';
  };

  home.file = {
    ".ssh/config" = { source = "/etc/nixos/home_manager/files/ssh_config"; };
    ".unison/tenant.prf" = { source = "/etc/nixos/home_manager/files/tenant.prf"; };
    ".unison/Surface.prf" = { source = "/etc/nixos/home_manager/files/surface.prf"; };
  };

  # Your existing configuration options go here...
}