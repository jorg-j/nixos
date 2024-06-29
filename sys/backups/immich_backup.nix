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

    current=$(date +%y_%m_%d)
    dest="/run/media/jack/ElementSE/immich_backups/$current.sql.gz"

    docker exec -t immich_postgres pg_dumpall --clean --if-exists --username=postgres | gzip > $dest

  '';


in {
  options.services.immichbackup = {
    enable = mkEnableOption "Immich Service";
  };

  config = mkIf cfg.enable {

    environment.systemPackages = [
      immichbackup
    ];

    systemd.services."immich_backup" = {
      # enable = true;
      description = "Immich Backup Service";

      serviceConfig.ExecStart = "${immichbackup}";
      wantedBy = [ "multi-user.target" ];
    };


  systemd.timers.immich_backupTimer = {
      description = "Immich Backup Service Daily";
      wantedBy = [ "timers.target" ];

      timerConfig = {
          unit = "immich_backup.service";
          # OnCalendar = "daily";
          OnCalendar = "*-*-* 12:23:00";
          Persistent = true;
          # onBootSec = "5min";
          # onUnitActiveSec = "60min";
      };

      unitConfig = {
        Unit = "immich_backup.service";
      }
  };
  };
}
