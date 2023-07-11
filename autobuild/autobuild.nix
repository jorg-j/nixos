{ config, lib, pkgs, ... }:

let

workingDirectory = "/var/lib/autobuild";
repositoryDirectory = "${workingDirectory}";
repository = "https://gitlab.com/jorgensen-j/nixos.git";
gitWithRepo = "git -C ${repositoryDirectory}";
nixFile = "hosts/vm_conf.nix";
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
      if [ ! -e ${workingDirectory} ]; then
        mkdir --parents ${workingDirectory}
      fi

      if [ ! -e ${repositoryDirectory} ]; then
        git clone ${repositoryDirectory}
      fi

      # Ensure that if cfg.repository is changed, origin is updated
      ${gitWithRepo} remote set-url origin ${repository}

      ${gitWithRepo} fetch origin main

      ${gitWithRepo} checkout FETCH_HEAD

      nix-build ${nixFile}


      ${gitWithRepo} gc --prune=all
      '';
    };

}
