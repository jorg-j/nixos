{ config, pkgs, lib, ... }:

with lib;

let

  cfg = config.our.roles.budgie;

in

{
  options.our.roles.budgie = {
    enable = mkEnableOption "budgie";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.desktopManager.budgie.enable = true;
    services.xserver.displayManager.lightdm.enable = true;

  };



}

