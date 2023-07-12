{ config, pkgs, ... }:
{

imports =
    [ 
      ./xfce_theme.nix
    ];


  environment.systemPackages = with pkgs;
    [
      caffeine-ng
      lightburn
      rpi-imager
      tree
      vorta
      xterm
    ];

}