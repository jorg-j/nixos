{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.discord;
in {
  options.our.software.discord = {
    enable = mkEnableOption "discord";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.discord
    ];
  };
}
