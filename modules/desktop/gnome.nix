{ config
, pkgs
, lib
, ...
}:
with lib; let
  cfg = config.our.roles.gnome;
in
{
  options.our.roles.gnome = {
    enable = mkEnableOption "enable gnome";
  };

  config = mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.gnome = {
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
    };
  };

  # imports =
  # [
  #   ./gnome_extensions.nix
  # ];
}
