{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.our.roles.cosmic;
in {
  options.our.roles.cosmic = {
    enable = mkEnableOption "cosmic";
  };

  config = mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    services.desktopManager.cosmic.enable = true;
    services.displayManager.sddm.enable = true;

    services.displayManager.defaultSession = "plasmax11";

  };
}
