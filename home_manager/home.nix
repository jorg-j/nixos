{ config, pkgs, ... }:
{
  imports = [
    ./pantheon.nix

  ];

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
    envExtra = ''
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
    '';
  };

  home.file = {
    ".ssh/config" = { source = "/etc/nixos/home_manager/files/ssh_config"; };
    ".unison/tenant.prf" = { source = "/etc/nixos/home_manager/files/tenant.prf"; };
    ".unison/Surface.prf" = { source = "/etc/nixos/home_manager/files/surface.prf"; };
    ".config/i3/config" = { source = "/etc/nixos/home_manager/files/i3_config"; };
    ".config/i3status/config" = { source = "/etc/nixos/home_manager/files/i3status.conf"; };
    ".mnti3/mounter" = { source = "/etc/nixos/home_manager/files/mounter"; };
    ".mnti3/unmounter" = { source = "/etc/nixos/home_manager/files/unmounter"; };
    ".config/nixpkgs/config.nix" = { source = "/etc/nixos/home_manager/files/nixpkgs_config.nix"; };
    ".config/code/User/settings.json" = { source = "/etc/nixos/home_manager/files/vscode.json"; };
  };

}
