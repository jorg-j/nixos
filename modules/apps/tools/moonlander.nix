{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.moonlander;
in {
  options.our.software.moonlander = {
    enable = mkEnableOption "moonlander";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.wally-cli
    ];
    hardware.keyboard.zsa.enable = true;
  };
}
