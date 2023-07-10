{ config, pkgs, ... }:
{
services.systemd.services.my-script = {
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
