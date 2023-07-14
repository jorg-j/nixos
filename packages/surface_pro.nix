{ config, pkgs, ... }:

{
 imports = [
      ./desktop.nix
    ];

  environment.systemPackages = with pkgs;
  [
    libwacom-surface
    xournal      
  ];

  
}
