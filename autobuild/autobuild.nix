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
        notify-send
      ];

      script = ''
        cd /etc/nixos && notify-send 'cd to nixos' && sudo git remote update && sudo git status -uno | grep -q 'Your branch is behind' && notify-send
      serviceConfig.User = "root";
    };

}