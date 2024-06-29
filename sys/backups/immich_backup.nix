{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.services.immichbackup;

  immichbackup = pkgs.writeScriptBin "immichbackup" ''
    #!${pkgs.stdenv.shell}

    current=$(date +%Y_%m_%d)
    dest="/run/media/jack/ElementSE/immich_backups/$current.sql.gz"
    ${pkgs.docker}/bin/docker exec -t immich_postgres pg_dumpall --clean --if-exists --username=postgres | ${pkgs.gzip}/bin/gzip > $dest
  '';


  immichbackupremove = pkgs.writeScriptBin "immichbackupremove" ''
    #!${pkgs.stdenv.shell}

    current=$(date -d "7 days ago" +"%Y_%m_%d")
    dest="/run/media/jack/ElementSE/immich_backups/$current.sql.gz"
    rm $dest
  '';

in {
  options.services.immichbackup = {
    enable = mkEnableOption "Immich Service";
  };

  config = mkIf cfg.enable {

    environment.systemPackages = [
      immichbackup
      immichbackupremove
    ];

    systemd.services."immich_backup" = {
      description = "Immich Backup Service";
      serviceConfig.ExecStart = "${immichbackup}/bin/immichbackup";
      wantedBy = [ "multi-user.target" ];
    };

    systemd.timers.immich_backupTimer = {
        description = "Immich Backup Service Daily";
        wantedBy = [ "timers.target" ];

        timerConfig = {
            unit = "immich_backup.service";
            OnCalendar = "daily";
            # OnCalendar = "*-*-* 00:31:00";
            Persistent = true;
        };

        unitConfig = {
          Unit = "immich_backup.service";
        };
      };


    systemd.services."immich_backup_remove" = {
      description = "Immich Backup Service Removal";
      serviceConfig.ExecStart = "${immichbackupremove}/bin/immichbackupremove";
      wantedBy = [ "multi-user.target" ];
    };

    systemd.timers.immich_backup_removeTimer = {
        description = "Immich Backup Remove Service Daily";
        wantedBy = [ "timers.target" ];

        timerConfig = {
            unit = "immich_backup_remove.service";
            OnCalendar = "daily";
            # OnCalendar = "*-*-* 00:31:00";
            Persistent = true;
        };

        unitConfig = {
          Unit = "immich_backup_remove.service";
        };
      };

  };
}
