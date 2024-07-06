{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.backups;
in {
  options.our.software.backups = {
    enable = mkEnableOption "backups";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.vorta
      pkgs.unison
    ];
  };
}
