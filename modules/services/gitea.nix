
{ config, pkgs, lib, ... }:

{
  # Ensure Gitea runner is available as a system package
  environment.systemPackages = with pkgs; [ gitea-runner ];

  # Define the systemd service
  systemd.services.gitea-runner = {
    description = "Gitea Runner Service";

    # Start the service after the network is online
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    # Command to execute the Gitea runner
    serviceConfig = {
      ExecStart = "${pkgs.gitea-runner}/bin/gitea-runner --server https://192.168.1.122:3100/ --token wzFYhfr00VtQeBCXUoFigdSsC0dkvtltEZ2Iqak0 --name my-runner";
      Restart = "always";
      User = "gitea-runner"; # Replace with an appropriate user
      WorkingDirectory = "/var/lib/gitea-runner"; # Set a working directory
    };

    # Optional: create a dedicated user for running the Gitea runner
    wantedBy = [ "multi-user.target" ];
  };

  # Create the user if it does not exist
  users.users.gitea-runner = {
    isSystemUser = true;
    description = "User for Gitea Runner";
    home = "/var/lib/gitea-runner";
    createHome = true;
  };
}

