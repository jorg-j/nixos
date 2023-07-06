{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
     celluloid
     deluge
     simplescreenrecorder
     
    ];

    services.udev.packages = [ pkgs.libu2f-host ];
}