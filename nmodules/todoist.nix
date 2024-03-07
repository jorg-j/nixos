{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.services.todoist_load;

  todoistload = pkgs.writeScriptBin "todoistload" ''
    #!${pkgs.stdenv.shell}

  '';

  my-python-packages = ps:
    with ps; [
      todoist-api-python
      loguru
      requests
    ];
in {
  options.services.todoist_load = {
    enable = mkEnableOption "Todoist Load Service";
  };

  config = mkIf cfg.enable {
    users.users.todoistHost = {
      isNormalUser = true;
      description = "todoist host user";
      home = "/home/todoist";
      extraGroups = [
        "todoist"
      ];

      createHome = true;
      # password = "";
      shell = pkgs.bash;
    };

    environment.systemPackages = [
      todoistload
      (pkgs.python3.withPackages my-python-packages)
    ];

    systemd.services."todoist_load" = {
      # enable = true;
      description = "Todoist Load Service";
      serviceConfig.Type = "oneshot";

      serviceConfig.ExecStart = let
        python = pkgs.python3.withPackages (ps:
          with ps; [
            todoist-api-python
            loguru
            requests
          ]);
      in "${python.interpreter} ${/etc/nixos/nmodules/todoist_files/todoist_load.py}";
    };
  };

  # systemd.timers.capaldiSyncTimer = {
  #     description = "Run Capaldi Sync every 60 minutes";
  #     wantedBy = [ "multi-user.target" ];
  #     partOf = [ "unionSync.service" ];

  #     timerConfig = {
  #         unit = "capaldiSync.service";
  #         onBootSec = "5min";
  #         onUnitActiveSec = "60min";
  #     };
  # };
}
