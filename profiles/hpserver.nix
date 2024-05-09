{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../home_manager
    ../packages/flatpak.nix
    ../sys
    ../modules/hp_server.nix

    ../users/jack.nix
  ];

  # enable xfce desktop
  # our.roles.budgie.enable = true;
  # our.roles.xfce.enable = true;
  # our.roles.plasma.enable = true;
  # our.roles.gnome.enable = true;
  our.roles.lxqt.enable = true;

  environment.systemPackages = with pkgs; [
    xournalpp
    gettext # needed for cinnamon
    caffeine-ng
  ];


  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
