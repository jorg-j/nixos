{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.espanso;
in {
  options.our.software.espanso = {
    enable = mkEnableOption "espanso";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      #      pkgs.espanso
    ];
  };
}
