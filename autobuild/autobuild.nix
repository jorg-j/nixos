{ config, lib, pkgs, ... }:

{

config.systemd.timers."autobuild" = {
  wantedBy = [ "multi-user.target" ];
  timerConfig = {
    OnCalendar = "*-*-* *:*:00";
    Persistent = true;
  };
};

config.systemd.services."autobuild" = {
      wantedBy = [ "multi-user.target" ];
      enable = true;

      path = with pkgs; [
        git
        nix
        systemd
      ];

      script = ''
        cd /etc/nixos && ns 'cd to nixos' && sudo git remote update && sudo git status -uno | grep -q 'Your branch is behind' && ns 'branch behind' && sudo git stash && sudo git pull --rebase && build && ns 'Build Complete'
      '';
      serviceConfig.User = "root";
    };

}