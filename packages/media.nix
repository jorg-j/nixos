{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
     celluloid
     deluge
     simplescreenrecorder
     imagemagick
    #  steam

    ];

    services.udev.packages = [ pkgs.libu2f-host ];
}