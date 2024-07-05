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
  # our.roles.lxqt.enable = true;
  # our.roles.i3.enable = true;
  # homemanager.i3.enable = true;

  environment.systemPackages = with pkgs; [
    # === libreoffice ===
    hunspell
    hunspellDicts.en_US-large
    libreoffice-fresh
    abiword
  ];
}
