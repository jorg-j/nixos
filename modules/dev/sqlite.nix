{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.sqlite;
in {
  options.our.software.sqlite = {
    enable = mkEnableOption "sqlite";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.sqlitebrowser
      pkgs.sqlite
    ];
  };
}
