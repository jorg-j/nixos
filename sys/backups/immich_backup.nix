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
      serviceConfig.Type = "oneshot";

      serviceConfig.ExecStart = immichbackup;
    };


  systemd.timers.immich_backupTimer = {
      description = "Immich Backup Service Daily";
      wantedBy = [ "multi-user.target" ];
      partOf = [ "immich_backup.service" ];

      timerConfig = {
          unit = "immich_backup.service";
          OnCalendar = "daily";
          # onBootSec = "5min";
          # onUnitActiveSec = "60min";
      };
  };
  };
}
