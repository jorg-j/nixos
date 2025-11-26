{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.arduino;
in {
  options.our.software.arduino = {
    enable = mkEnableOption "arduino";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.arduino-ide
      pkgs.python3Packages.pyserial
      # pkgs.python3Packages.esptool
    ];
  };
}
