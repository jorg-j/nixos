{ lib, pkgs, config, ... }:

with lib;                      
let

  cfg = config.services.todoist_creator;

in {
  # Declare what settings a user of this "hello.nix" module CAN SET.
  options.services.todoist_creator = {
    enable = mkEnableOption "Todoist Creator";
    script = mkOption {
      type = types.str;
      default = "/etc/nixos/modules/services/todoist/scripts/weekdays.sh";
    };
    serviceName = mkOption {
      type = types.str;
      default = "name";
    };
  };


  config = mkIf cfg.enable {

    systemd.services."${cfg.serviceName}"= {
        # enable = true;
        description = "Todoist Weekly";
        path = [ pkgs.libossp_uuid ];
        serviceConfig.Type = "oneshot";
        serviceConfig.ExecStart = "${pkgs.bash}/bin/bash ${escapeShellArg cfg.script}";
        serviceConfig.User = "jack";
    };

    systemd.timers.todoist_weeklyTimer = {
        description = "Run Todoist Weekly Loader Every Sunday";
        wantedBy = [ "timers.target" ];
            timerConfig = {
                Unit = "todoist_weekly.service";
                OnCalendar = "Sun 3:55:00";
        };
    };

  };
}