{ config, pkgs, lib, ... }:

{# Enable XFCE

imports =
    [ 
      ./xfce_theme.nix
    ];

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

