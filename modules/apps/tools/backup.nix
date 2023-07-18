{ pkgs, ... }:

{
  # General configuration options

  # Define a function that returns the system packages based on the hostname
  systemPackages = config: with pkgs;
    if config.networking.hostName != "tenant" then
      [ vorta borgbackup ]
    else
      [ borgbackup ];

  # Set the systemPackages attribute using the defined function
  environment.systemPackages = systemPackages config;

  # Other configuration settings
}