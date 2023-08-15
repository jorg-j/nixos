{ lib, pkgs, config, ... }:


with lib;                      
let

  cfg = config.services.todoist_load;

  todoistload = pkgs.writeScriptBin "todoistload" ''
    #!${pkgs.stdenv.shell}

  '';

in {
    imports = [
    <home-manager/nixos>
    ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.jack = import ./home.nix;
    };


    # Declare what settings a user of this "hello.nix" module CAN SET.
    options.services.todoist_load = {
        enable = mkEnableOption "Todoist Load Service";
    };


    # by setting "services.capaldiSync.enable = true;"

    config = mkIf cfg.enable {

    environment.systemPackages = [
        todoistload
    ];

    systemd.services."todoist_load"= {
        # enable = true;
        description = "Todoist Load Service";
        serviceConfig.Type = "oneshot";
        script = ''
        ${pkgs.bash}/bin/bash /home/jack/test.sh
      '';
        };
    };

    home.file = {
        "shell.nix" = { source = "/etc/nixos/nmodules/todoist_files/shell.nix"; };
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