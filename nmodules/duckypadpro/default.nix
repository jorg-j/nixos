{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  duckypadpro = pkgs.callPackage ./derivation.nix {};
  cfg = config.services.duckypadpro;
in {
  options.services.duckypadpro = {
    enable = mkEnableOption "Duckypad Pro app";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      duckypadpro
      python3Packages.pyautogui
      python3Packages.appdirs
      python3Packages.hidapi
    ];
    services.udev.packages = [duckypadpro];
  };
}
