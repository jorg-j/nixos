{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../home_manager
    ../packages/flatpak.nix
    ../sys
    ../modules
    ../users/jack.nix
  ];

  # enable xfce desktop
  # our.roles.budgie.enable = true;
  # our.roles.xfce.enable = true;
  # our.roles.plasma.enable = true;
  # our.roles.gnome.enable = true;
  # our.roles.cinnamon.enable = true;
  # our.roles.mate.enable = true;

  # Enable Streamdeck UI
  # programs.streamdeck-ui.enable = true;
  # our.roles.homemanager.i3 = true;
}
