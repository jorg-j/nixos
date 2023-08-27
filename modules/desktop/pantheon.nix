{ config, pkgs, lib, ... }:

{

  services.xserver.enable = true;
  services.xserver.desktopManager.pantheon.enable = true;
  services.xserver.displayManager.lightdm.enable = true;


}

