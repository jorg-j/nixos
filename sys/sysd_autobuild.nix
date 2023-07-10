{ config, pkgs, ... }:
{


systemPackages = with pkgs; [
  (writeTextFile {
    name = "autobuild.sh";
    text = "cd /etc/nixos && sudo git remote update && sudo git status -uno | grep -q 'Your branch is behind' && sudo git stash && sudo git pull --rebase && sudo nixos-rebuild switch --keep-going && ns 'Build Complete'";
    executable = true;
    destination = "/etc/autobuild.sh";

  })
];

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
    ExecStart = "${pkgs.stdenv.shell} -c \" /etc/autobuild.sh\"";
    User = "root";
  };
};
}
