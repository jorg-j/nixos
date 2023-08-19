{ lib, pkgs, config, script, serviceName, calendar, ... }:

{
  # === Setup Service ===
  systemd.services."${serviceName}" = {
    # enable = true;
    description = "Todoist Loader Service";
    path = [ pkgs.libossp_uuid ];
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash ${script}";
      Type = "oneshot";
      User = "jack";
    };
  };

  # === Setup Timer ===
  systemd.timers.todoist_weekdaysTimer = {
    description = "Run Todoist Loader";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      Unit = "${serviceName}.service";
      OnCalendar = "${calendar}";
    };
  };
}
