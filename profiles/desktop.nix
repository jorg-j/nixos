{ config, pkgs, ... }:
{
  imports = [
    ./base.nix
    ../modules/desktop/pantheon.nix

  ];

  services.xserver = {
    enable = true;
    # desktopManager.cinnamon.enable = true;
  };

  environment.systemPackages = with pkgs;
    [
      xournalpp
      gettext # needed for cinnamon
      caffeine-ng
    ];
}
