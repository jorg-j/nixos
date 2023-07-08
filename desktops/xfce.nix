{ config, pkgs, lib, ... }:

{# Enable XFCE

  services.xserver = {
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };

  environment = {
    systemPackages = with pkgs; [
      xfce.xfce4-whiskermenu-plugin
    ];
  };

}

