{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
     rpi-imager
     lightburn
     vorta
     caffeine-ng
    ];

}