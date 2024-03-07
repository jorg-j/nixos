args @ {
  lib,
  pkgs,
  config,
  ...
}: let
  script = "/etc/nixos/modules/services/todoist/scripts/weekdays.sh";
  serviceName = "todoistCreatorWeekdays";
  calendar = "Mon..Fri 3:55:00";
in {
  imports = [
    (import ./todoist_sysd.nix (args
      // {
        script = script;
        serviceName = serviceName;
        calendar = calendar;
      }))
  ];
}
