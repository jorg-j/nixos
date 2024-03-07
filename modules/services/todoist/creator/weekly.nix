args @ { lib
, pkgs
, config
, ...
}:
let
  script = "/etc/nixos/modules/services/todoist/scripts/weekly.sh";
  serviceName = "todoistCreatorWeekly";
  calendar = "Sun 3:55:00";
in
{
  imports = [
    (import ./todoist_sysd.nix (args
      // {
      script = script;
      serviceName = serviceName;
      calendar = calendar;
    }))
  ];
}
