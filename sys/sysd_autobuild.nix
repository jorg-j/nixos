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
  enable = true;
  description = "autobuild";
  serviceConfig = {
    Type = "simple";
    ExecStart = "sudo ${pkgs.stdenv.shell} -c \"/etc/nixos/sys/autobuild.sh\"";
    User = "root";
  };
};
}
