{ config, pkgs, lib, ... }:

{
  powerManagement = lib.mkIf (config.networking.hostName == "surface") {
    enable = true;
    cpuFreqGovernor = "powersave";
  };
}
