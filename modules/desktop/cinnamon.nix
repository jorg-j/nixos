{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.our.roles.cinnamon;
in {
  options.our.roles.cinnamon = {
    enable = mkEnableOption "cinnamon";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.libinput.enable = true;
    services.xserver.desktopManager.cinnamon.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
  };
}
