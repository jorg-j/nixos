{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.lightburn;
in {
  options.our.software.lightburn = {
    enable = mkEnableOption "lightburn";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.lightburn
    ];
  };
}
