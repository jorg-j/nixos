{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
      caffeine-ng
      lightburn
      rpi-imager
      tree
      vorta
    ];

}