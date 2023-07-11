{ config, lib, pkgs, ... }:

let

workingDirectory = "/var/lib/autobuild";
repositoryDirectory = "${workingDirectory}/repo";
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
        git clone ${lib.cli.toGNUCommandLineShell {} {
          local = (isPathType cfg.repository);
        }} ${lib.escapeShellArg cfg.repository} ${repositoryDirectory}
      fi

      # Ensure that if cfg.repository is changed, origin is updated
      ${gitWithRepo} remote set-url origin ${lib.escapeShellArg cfg.repository}

      ${gitWithRepo} fetch origin ${lib.escapeShellArg cfg.branch}

      ${gitWithRepo} checkout FETCH_HEAD

      nix-build ${lib.escapeShellArg "${repositoryDirectory}${cfg.nixFile}"}


      ${gitWithRepo} gc --prune=all
      '';
    };

};
}