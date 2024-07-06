{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.ansible;
in {
  options.our.software.ansible = {
    enable = mkEnableOption "ansible";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ansible
      python311Packages.ansible-core
    ];
  };
}
