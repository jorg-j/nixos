{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
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
