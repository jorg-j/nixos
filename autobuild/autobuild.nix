{ config, lib, pkgs, ... }:

{

config.environment.etc = {
  autobuild = {
    text = ''
    cd /etc/nixos && git remote update && git status -uno | grep -q 'Your branch is behind' && git stash && git pull --rebase && nixos-rebuild switch --keep-going
    '';
    mode = "0777";
  };
};

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

    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.stdenv.shell} -c \" /etc/autobuild\"";
        User = "root";
    };

};
}