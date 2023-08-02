{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
     celluloid
     deluge
     imagemagick
     simplescreenrecorder
     #labelImg
     okular
    ];

    services.udev.packages = [ pkgs.libu2f-host ];
}