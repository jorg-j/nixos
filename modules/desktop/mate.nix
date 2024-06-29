{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.our.roles.mate;
in {
  options.our.roles.mate = {
    enable = mkEnableOption "mate";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.libinput.enable = true;
    services.xserver.desktopManager.mate.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
  };
}
