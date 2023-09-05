{ lib, pkgs, config, ... }:
with lib;
let

  cfg = config.services.capaldiSync;

  capaldisync = pkgs.writeScriptBin "capaldisync" ''
    #!${pkgs.stdenv.shell}
    sync_files() {
        SYNCLOC=capaldi:/home/pi/Downloads/rdl/storage/
        FileSourceDir="/run/media/jack/Backup/WMM/rdlyeti/"
        CLEANUPLOC=/home/pi/Downloads/rdl/storage
        ssh capaldi "cd /home/pi/Downloads/rdl && sudo chown -R pi:pi ./"
        rsync --archive --verbose --remove-source-files $SYNCLOC $FileSourceDir
    }


    ping_capaldi() {
        server_ip="192.168.1.105"

        ping_count=3  # Number of ping attempts

        ping_result=$(ping -c "$ping_count" "$server_ip" 2>&1)

        if [[ $? -ne 0 ]]; then
            echo "Server at $server_ip is not responding."
            exit 0

        else
            echo "Server at $server_ip is responding."
            # sync_files
        fi
    }


    check_drive() {
        drive_label="Backup"

        # Check if the drive is mounted
        if grep -qs "/dev/sd.*$drive_label" /proc/mounts; then
            echo "Drive '$drive_label' is connected."
            ping_capaldi
        else
            echo "Drive '$drive_label' is not connected."
            exit 0
        fi
    }

    check_drive
  '';

in
{
  # Declare what settings a user of this "hello.nix" module CAN SET.
  options.services.capaldiSync = {
    enable = mkEnableOption "capaldi Sync Service";
  };


  # by setting "services.capaldiSync.enable = true;"

  config = mkIf cfg.enable {

    environment.systemPackages = [
      capaldisync
    ];

    systemd.services."capaldiSync" = {
      # enable = true;
      description = "Capaldi Sync Service";
      serviceConfig = {
        Type = "simple";
        ExecStart = "/run/current-system/sw/bin/capaldisync";
      };
    };

    systemd.timers.capaldiSyncTimer = {
      description = "Run Capaldi Sync every 60 minutes";
      wantedBy = [ "multi-user.target" ];
      partOf = [ "unionSync.service" ];

      timerConfig = {
        unit = "capaldiSync.service";
        onBootSec = "5min";
        onUnitActiveSec = "60min";
      };
    };
  };
}
