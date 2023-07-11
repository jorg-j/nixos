{ config, lib, pkgs, ... }:
#
let

workingDirectory = "/etc/nixos";
repositoryDirectory = "${workingDirectory}";
repository = "https://gitlab.com/jorgensen-j/nixos.git";
gitWithRepo = "git -C ${repositoryDirectory}";
nixFile = "${repositoryDirectory}/hosts/vm_conf.nix";
in

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
      ${gitWithRepo} remote update
      ${gitWithRepo} status -uno | grep -q 'Your branch is behind' && ${gitWithRepo} stash && ${gitWithRepo} pull --rebase && nixos-rebuild switch --keep-going

      ${gitWithRepo} gc --prune=all
      '';
    };

}
