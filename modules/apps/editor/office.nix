{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.office;
in {
  options.our.software.office = {
    enable = mkEnableOption "office";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.abiword
      pkgs.gnumeric
      # === libreoffice ===
      pkgs.hunspell
      pkgs.hunspellDicts.en_US-large
      pkgs.libreoffice-fresh
      pkgs.projectlibre
    ];
  };
}
