{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.vnc;
in {
  options.our.software.vnc = {
    enable = mkEnableOption "vnc";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.x11vnc
      # realvnc-vnc-viewer # VNC viewer
      pkgs.tigervnc
      pkgs.xorg.xinit
    ];
  };
}
