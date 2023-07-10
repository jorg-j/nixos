{ config, pkgs, ... }:
{
config.systemd.services.autobuild = {
  enable = true;
  description = "autobuild";
  serviceConfig = {
    Type = "simple";
    ExecStart = "/bin/bash -c \"/etc/nixos/sys/autobuild.sh\"";
    User = "root";
  };
  wantedBy = [ "multi-user.target" ];
  timerConfig = {
    OnCalendar = "*-*-* *:*:00";
    Persistent = true;
  };
};
}
