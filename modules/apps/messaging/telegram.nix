{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.telegram;
in {
  options.our.software.telegram = {
    enable = mkEnableOption "telegram";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.tdesktop
    ];
  };
}
