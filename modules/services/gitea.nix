{ config, pkgs, ... }:

{
  services.gitea-runner = {
    enable = true;
    
    # Replace with your Gitea instance's URL
    giteaUrl = "https://192.168.1.122:3100/";
    
    # Replace with the appropriate token for the runner
    token = "wzFYhfr00VtQeBCXUoFigdSsC0dkvtltEZ2Iqak0";

    # You can specify additional arguments if needed
    extraOptions = "--name my-runner --executor shell";

    # Optional: specify a working directory for the runner
    workingDirectory = "/var/lib/gitea-runner";
  };

  # Ensure the package is installed
  environment.systemPackages = with pkgs; [ gitea-runner ];
}
