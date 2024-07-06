{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.kdenlive;
in {
  options.our.software.kdenlive = {
    enable = mkEnableOption "kdenlive";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.kdenlive
    ];
  };
}
