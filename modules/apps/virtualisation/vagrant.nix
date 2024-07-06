{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.vagrant;
in {
  options.our.software.vagrant = {
    enable = mkEnableOption "vagrant";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.vagrant
    ];
  };
}