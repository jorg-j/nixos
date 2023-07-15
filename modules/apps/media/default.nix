{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
     celluloid
     deluge
     imagemagick
     simplescreenrecorder
    ];

    services.udev.packages = [ pkgs.libu2f-host ];
}