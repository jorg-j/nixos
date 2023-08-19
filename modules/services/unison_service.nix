{ config, pkgs, ... }:

{
  systemd.services."unisonSync" = {
    # enable = true;
    description = "Unison Sync Service";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.unison}/bin/unison tenant.prf";
      restart = "on-failure";
    };
  };

  systemd.timers.unisonSyncTimer = {
    description = "Run Unison Sync every 30 minutes";
    wantedBy = [ "multi-user.target" ];
    partOf = [ "unionSync.service" ];

    timerConfig = {
      unit = "unisonSync.service";
      onBootSec = "1min";
      onUnitActiveSec = "30min";
    };
  };
}
