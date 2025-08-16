{ pkgs, lib, ... }:
  # Note to Future me: you can use the following command to check the timer syntax is being parsed correctly
  # systemd-analyze calendar --iterations=5 "Mon,Fri 6,7:0/5:00"

let
  # Absolute path to your project directory
  projectDir = "/home/jack/Docker/eink_dash/utils";

  # Create a wrapper script that handles the virtual environment
  runScript = pkgs.writeShellScriptBin "run-ptv-handler" ''
    set -e
    cd ${projectDir}
    
    # Setup virtual environment if missing
    if [ ! -d "venv" ]; then
      ${pkgs.python3}/bin/python -m venv venv
    fi

    # Activate virtual environment
    source venv/bin/activate

    # Install dependencies if requirements.txt exists
    if [ -f "requirements.txt" ]; then
      pip install -r requirements.txt
    fi

    # Run the script
    python ptv_handler.py
  '';
in {
  systemd.services.ptv_update = {
    serviceConfig = {
      Type = "oneshot";
      WorkingDirectory = "/home/jack/Docker/eink_dash/utils";
      Environment = [
        "LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib"
      ];
    };
    script = "${runScript}/bin/run-ptv-handler";
    serviceConfig.User = "jack";
    serviceConfig.Group = "users";
    environment = {PYTHONPATH = "/home/jack/Docker/eink_dash/utils";};
    serviceConfig.ProtectSystem = "strict";
    serviceConfig.PrivateTmp = true;
  };


  systemd.timers.ptv_update = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = [
        # Weekdays 6am-8:30am every 5 minutes
	"Mon..Fri 6,7:03/5:00"
        # Weekdays 4pm-7pm every 15 minutes
	"Mon..Fri 16,17,18:03/15:00"
	"Mon..Fri 8..15:03/30:00"
	"Sat,Sun 8..20:01/30:00"
	#"Mon..Fri *-*-* 16:00:00..19:00:00/15min"
      ];
      Persistent = true;
      Unit = "ptv_update.service";
    };
  };
  }
