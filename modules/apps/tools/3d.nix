{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.modeling;
in {
  options.our.software.modeling = {
    enable = mkEnableOption "modeling";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.openscad
      # pkgs.blender
    ];
  };
}
