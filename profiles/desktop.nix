{ config, pkgs, ... }:
{
  imports = [
    ../home_manager
    ../packages/flatpak.nix
    ../sys
    ../modules
    ../users/jack.nix
    ../modules/desktop/pantheon.nix
  ];

  environment.systemPackages = with pkgs;
    [
      xournalpp
      gettext # needed for cinnamon
      caffeine-ng
    ];

  # Enable Streamdeck UI
  programs.streamdeck-ui.enable = true;



}
