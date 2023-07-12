{ config, pkgs, ... }:
{

imports =
    [ 
      ../modules/desktop/xfce_theme.nix
    ];


  environment.systemPackages = with pkgs;
    [
      caffeine-ng
      lightburn
      rpi-imager
      tree
      vorta
      xterm
      xfce.xfce4-terminal
    ];

}