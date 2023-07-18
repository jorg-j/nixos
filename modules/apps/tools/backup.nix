{ pkgs, ... }:

{
  # General configuration options

  environment.systemPackages = with pkgs; [
    # Include borgbackup unconditionally
    borgbackup
  ] ++ if config.networking.hostName != "tenant" then
    [ vorta ]
  else
    [];

  # Other configuration settings
}
