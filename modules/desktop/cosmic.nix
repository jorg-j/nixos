{ config, pkgs, lib, ... }:



with lib;
let
  cfg = config.our.roles.cosmic;
in
{

  options.our.roles.cosmic = {
    enable = mkEnableOption "enable cosmic";

  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pop-desktop-widget
      pop-control-center
      pop-launcher
      pop-shell-shortcuts
    ];

    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
      desktopManager.gnome.enable = true;
    };

    gnome.core-utilities.enable = true;

  };


}
