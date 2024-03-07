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
  # our.roles.xfce.enable = true;
  our.roles.plasma.enable = true;
  # our.roles.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    xournalpp
    gettext # needed for cinnamon
    caffeine-ng
  ];

  # Enable Streamdeck UI
  programs.streamdeck-ui.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
