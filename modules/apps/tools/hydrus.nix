{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.hydrus;
in {
  options.our.software.hydrus = {
    enable = mkEnableOption "hydrus";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.hydrus
      # pkgs.unison
    ];
  };
}
