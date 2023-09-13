{ config, pkgs, ... }:

{
  imports = [
    ../home_manager
    ../sys
    ../modules
    ../users/jack.nix
  ];

  # enable budgie desktop
  our.roles.budgie.enable = true;

  environment.systemPackages = with pkgs;
    [
      libwacom-surface
      libwacom
      xournalpp
      gettext # needed for cinnamon
    ];
}
