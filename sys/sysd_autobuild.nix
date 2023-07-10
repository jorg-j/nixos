{ config, pkgs, ... }:
{

config.systemd.timers."autobuild" = {
  wantedBy = [ "multi-user.target" ];
  timerConfig = {
    OnCalendar = "*-*-* *:*:00";
    Persistent = true;
  };
};



config.systemd.services."autobuild" = {
  script = ''
  ${pkgs.stdenv.shell} cd /etc/nixos && ns 'cd to nixos' && sudo git remote update && sudo git status -uno | grep -q 'Your branch is behind' && ns 'branch behind' && sudo git stash && sudo git pull --rebase && build && ns 'Build Complete'
  '';
  enable = true;
  description = "autobuild";
  serviceConfig = {
    Type = "simple";
    User = "root";
  };
};
}
