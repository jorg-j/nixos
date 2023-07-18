{ config, pkgs, ... }:

let
  hostnamePackages =
    if config.networking.hostName != "tenant" then
      [ pkgs.vorta pkgs.borgbackup ]
    else
      [ pkgs.borgbackup ];
in

{
  environment.systemPackages = config.environment.systemPackages // hostnamePackages;
}