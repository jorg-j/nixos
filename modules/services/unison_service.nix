{ config, pkgs, ... }:

{
  systemd.services."unisonSync"= {
    description = "Unison Sync Service";
    serviceConfig = {
      type = "simple";
      workingDirectory = "/home/jack/.unison";
      execStart = "${pkgs.unison}/bin/unison tenant.prf";
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