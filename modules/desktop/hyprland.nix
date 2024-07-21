{
  config,
  pkgs,
  callPackage,
  lib,
  ...
}:
with lib; let
  cfg = config.our.roles.hyprland;
in {
        imports = [
                # ../../home_manager/hyprlandgtk.nix

        ];

  options.our.roles.hyprland = {
    enable = mkEnableOption "hyprland";
  };

  config = mkIf cfg.enable {
          programs.hyprland = {
                  enable = true;
                  xwayland.enable = true;
          };

          services.gnome.gnome-keyring.enable = true;

          environment.systemPackages = with pkgs; [
            gnome.nautilus         # Filemanager
            networkmanagerapplet   # network manager
            bashmount              # mount dir
            waybar                 # status bar
            swaynotificationcenter # notifications
            pavucontrol            # audio control
            glib                   # used for gsettings
            swaybg                 # wallpaper manager
            swaylock               # lockscreen
          ];

          fonts = {
                  packages = with pkgs; [
                          font-awesome
                          noto-fonts
                  ];
          };
  xdg.portal = {
    enable = true;
    #extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  };
}
