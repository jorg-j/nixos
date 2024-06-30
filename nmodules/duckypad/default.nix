{
lib,
  config,
  pkgs,
  ...
}: with lib; let
  duckypad = pkgs.callPackage ./derivation.nix {};
cfg = config.services.duckypad;

in {

  options.services.duckypad = {
    enable = mkEnableOption "Duckypad app";
  };
  config = mkIf cfg.enable {


    environment.systemPackages = with pkgs; [
        duckypad
        python3Packages.pyautogui 
        python3Packages.appdirs 
        python3Packages.hidapi
    ];
    services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="d11c", TAG+="uaccess", TAG+="udev-acl"
    '';
  };
}
