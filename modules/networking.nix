{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
with lib; let
  cfg = config.our.software.tailscale;
in {
  options.our.software.tailscale = {
    enable = mkEnableOption "tailscale";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs.tailscale
    ];
    # enable the tailscale service
    services.tailscale.enable = true;
  };
}