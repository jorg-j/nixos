{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../home_manager
    ../sys
    ../modules
    ../users/jack.nix
  ];

  # enable gnome desktop
  our.roles.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    libwacom-surface
    libwacom
    xournalpp
    gettext # needed for cinnamon
  ];
}
