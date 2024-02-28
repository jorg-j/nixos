{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
      celluloid
      deluge
      drawio
      imagemagick
      lightburn
      simplescreenrecorder
      #labelImg
      okular
    ];

  services.udev.packages = [ pkgs.libu2f-host ];
}
