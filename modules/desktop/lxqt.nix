{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.our.roles.lxqt;
in {
  options.our.roles.lxqt = {
    enable = mkEnableOption "lxqt";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.desktopManager.lxqt.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
  };
}
