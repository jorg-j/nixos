{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ../modules/desktop/gnome.nix
  ];

  environment.systemPackages = with pkgs;
  [
    libwacom-surface
    libwacom
    xournalpp      
  ];
}