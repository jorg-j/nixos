{
  config,
  pkgs,
  callPackage,
  lib,
  ...
}:
with lib; let
  cfg = config.our.roles.i3;
in {
  options.our.roles.i3 = {
    enable = mkEnableOption "i3";
  };

  config = mkIf cfg.enable {
    # Activate for non gtk desktop environments
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdg.portal.config.common.default = "*";
    programs.dconf.enable = true;

    environment.pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw
    services.displayManager.defaultSession = "none+i3";
    services.xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3status # gives you the default i3 status bar
          i3lock #default i3 screen locker
          i3blocks #if you are planning on using i3blocks over i3status
        ];
      };
    };
    environment.systemPackages = with pkgs; [
      xfce.thunar
      lxappearance
      pcmanfm-qt
      dunst # notifications
      picom
      nitrogen
    ];
  };
}
