{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ../modules/desktop/gnome.nix
    ../modules
  ];

  environment.systemPackages = with pkgs;
  [
    libwacom-surface
    xournal      
  ];
}