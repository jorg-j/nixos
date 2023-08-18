{ lib, pkgs, config, ... }:

let

    script = "/etc/nixos/modules/services/todoist/scripts/weekdays.sh";
    serviceName = "todoistCreatorWeekdays";

in
{
    # Setup Job Runners and Timer
    # Weekdays
    systemd.services."${serviceName}"= {
        # enable = true;
        description = "Todoist Weekdays";
        path = [ pkgs.libossp_uuid ];
        serviceConfig = {
            ExecStart = "${pkgs.bash}/bin/bash ${script}";
            Type = "oneshot";
            User = "jack";
        };
    };

    systemd.timers.todoist_weekdaysTimer = {
        description = "Run Todoist Weekday Loader Every weekday";
        wantedBy = [ "timers.target" ];
            timerConfig = {
                Unit = "${serviceName}.service";
                OnCalendar = "Mon..Fri 3:55:00";
        };
    };
}