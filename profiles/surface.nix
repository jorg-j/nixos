{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    #../modules/desktop/gnome.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    libwacom-surface
    libwacom
    xournalpp      
  ];
}
