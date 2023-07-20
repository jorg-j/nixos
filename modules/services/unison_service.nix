{ config, pkgs, ... }:

{
  systemd.services."unisonSync"= {
    description = "Unison Sync Service";
    path = with pkgs; [ bash ];
    script = ''
      cd /home/jack/.unison
      bash unison tenant.prf
    '';
    serviceConfig = {
      type = "simple";
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