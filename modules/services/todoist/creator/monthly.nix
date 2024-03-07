args @ {
  lib,
  pkgs,
  config,
  ...
}: let
  script = "/etc/nixos/modules/services/todoist/scripts/monthly.sh";
  serviceName = "todoistCreatorMonthly";
  calendar = "*-*-1 3:56:00";
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
