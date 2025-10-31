{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  # enables toggle from host file
  cfg = config.our.roles.plasma;
in {
  options.our.roles.plasma = {
    enable = mkEnableOption "plasma";
  };

  config = mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    # services.xserver.displayManager.sddm.enable = true;
    # services.xserver.desktopManager.plasma5.enable = true;

    # Plasma 6
    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm.enable = true;

    services.displayManager.defaultSession = "plasmax11";
    programs.kdeconnect.enable = true;

    environment = {
      systemPackages = with pkgs; [
        kdePackages.kde-gtk-config
        kdePackages.yakuake
	cosmic-files
      ];
    };
  };
}
