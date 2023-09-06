{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
    ../modules/desktop/pantheon.nix
  ];

  environment.systemPackages = with pkgs;
    [
      xournalpp
      gettext # needed for cinnamon
      caffeine-ng
       # needed for cinnamon
    ];

  programs.streamdeck-ui.enable = true;
}
