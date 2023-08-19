{ lib, pkgs, config, ... }:

with lib;

let
  todoist_load = pkgs.callPackage ./derivation.nix { };

  my-python-packages = ps: with ps; [
    loguru
    requests
    todoist-api-python
  ];

in
{

  imports = [
    ./creator/weekdays.nix
    ./creator/weekly.nix
    ./creator/monthly.nix
  ];

  environment.systemPackages = [
    todoist_load
    pkgs.libossp_uuid
    (pkgs.python3.withPackages my-python-packages)
  ];

  # Setup Todoist Runner and Timer
  systemd.services."todoist_load_runner" = {
    # enable = true;
    description = "Todoist Load Service";
    serviceConfig.Type = "oneshot";
    serviceConfig.ExecStart = "${todoist_load}/bin/todoist_load -i /home/jack";
    serviceConfig.User = "jack";
  };

  systemd.timers.todoist_load_runnerTimer = {
    description = "Run Todoist Load Runner Every Day";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      Unit = "todoist_load_runner.service";
      OnCalendar = "*-*-* 4:00:00";
    };
  };

}

