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

    current=$(date +"%y_%m_%d)
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
  };

  # systemd.timers.capaldiSyncTimer = {
  #     description = "Run Capaldi Sync every 60 minutes";
  #     wantedBy = [ "multi-user.target" ];
  #     partOf = [ "unionSync.service" ];

  #     timerConfig = {
  #         unit = "capaldiSync.service";
  #         onBootSec = "5min";
  #         onUnitActiveSec = "60min";
  #     };
  # };
}
