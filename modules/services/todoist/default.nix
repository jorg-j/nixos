{ lib, pkgs, config, ... }:

with lib;

let

    todoist_load = pkgs.callPackage ./derivation.nix {};

    my-python-packages = ps: with ps; [
        loguru
        requests
        todoist-api-python
    ];

in {

    environment.systemPackages = [
      todoist_load
      libossp_uuid
      (pkgs.python3.withPackages my-python-packages)
    ];

    # Setup Todoist Runner and Timer
    #systemd.services."todoist_load_runner"= {
    #    # enable = true;
    #    description = "Todoist Load Service";
    #    serviceConfig.Type = "oneshot";
    #    serviceConfig.ExecStart = "${pkgs.todoist_load}/bin/todoist_load /home/jack";
        # serviceConfig.User = "jack";
    #};

    #systemd.timers.todoist_load_runnerTimer = {
    #    description = "Run Todoist Load Runner Every Day";
    #    wantedBy = [ "timers.target" ];
    #        timerConfig = {
    #            Unit = "todoist_load_runner.service";
    #            OnCalendar = "*-*-* 4:00:00";
    #    };
    #};


    # Setup Job Runners and Timer
    # Weekdays
    systemd.services."todoist_weekdays"= {
        # enable = true;
        description = "Todoist Weekdays";
        serviceConfig.Type = "oneshot";
        serviceConfig.ExecStart = "${pkgs.bash}/bin/bash /etc/nixos/modules/services/todoist/scripts/weekdays.sh";
        serviceConfig.User = "jack";
    };

    systemd.timers.todoist_weekdaysTimer = {
        description = "Run Todoist Weekday Loader Every weekday";
        wantedBy = [ "timers.target" ];
            timerConfig = {
                Unit = "todoist_weekdays.service";
                OnCalendar = "Mon..Fri 3:55:00";
        };
    };

    # Weekly
    systemd.services."todoist_weekly"= {
        # enable = true;
        description = "Todoist Weekly";
        serviceConfig.Type = "oneshot";
        serviceConfig.ExecStart = "${pkgs.bash}/bin/bash /etc/nixos/modules/services/todoist/scripts/weekly.sh";
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

    # Monthly
    systemd.services."todoist_monthly"= {
        # enable = true;
        description = "Todoist Monthly";
        serviceConfig.Type = "oneshot";
        serviceConfig.ExecStart = "${pkgs.bash}/bin/bash /etc/nixos/modules/services/todoist/scripts/monthly.sh";
        serviceConfig.User = "jack";
    };

    systemd.timers.todoist_monthlyTimer = {
        description = "Run Todoist Monthly Loader";
        wantedBy = [ "timers.target" ];
            timerConfig = {
                Unit = "todoist_monthly.service";
                OnCalendar = "*-*-1 3:56:00";
        };
    };

}

