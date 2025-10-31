{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  rmsu = pkgs.callPackage ./derivation.nix {};
  cfg = config.services.rmsu;
in {
  options.services.rmsu = {
    enable = mkEnableOption "RMSU app";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rmsu
      rustc
    ];
    services.udev.packages = [rmsu];
  };
}
