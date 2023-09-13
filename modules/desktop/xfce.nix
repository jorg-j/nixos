{ config, pkgs, lib, ... }:

with lib;

let

  cfg = config.our.roles.xfce;

in

{

  imports =
    [
      ./xfce_theme.nix
    ];


  options.our.roles.xfce = {
    enable = mkEnableOption "xfce";
  };


  config = mkIf cfg.enable {


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
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  };

}
