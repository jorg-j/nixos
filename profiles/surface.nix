{ config, pkgs, ... }:

{
  imports = [
    ../home_manager
    ../sys
    ../modules
    ../users/jack.nix
    ../modules/desktop/pantheon.nix
  ];


  environment.systemPackages = with pkgs;
    [
      libwacom-surface
      libwacom
      xournalpp
      gettext # needed for cinnamon
    ];
}
