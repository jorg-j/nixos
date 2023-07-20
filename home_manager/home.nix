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
    ".unison/tenant.prf" = { source = "/etc/nixos/home_manager/files/unison.prf"; };
  };

  # Your existing configuration options go here...

  systemd.services.unisonSync = {
    description = "Unison Sync Service";
    type = "simple";
    workingDirectory = "/home/jack/.unison";
    execStart = "${pkgs.unison}/bin/unison tenant.prf";
    restart = "on-failure";
  };

  systemd.timers.unisonSyncTimer = {
    description = "Run Unison Sync every 30 minutes";
    unit = "unisonSync.service";
    onBootSec = "1min";
    onUnitActiveSec = "30min";
  };


}