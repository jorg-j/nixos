{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.rpi;
in {
  options.our.software.rpi = {
    enable = mkEnableOption "rpi";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.rpi-imager
    ];
  };
}
