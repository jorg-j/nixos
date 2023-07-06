{ config, pkgs, lib, ... }:

{# Enable XFCE

  services.xserver = {
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };


}