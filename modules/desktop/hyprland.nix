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
            xfce.thunar            # Filemanager
            networkmanagerapplet   # network manager
            bashmount              # mount dir
            waybar                 # status bar
            swaynotificationcenter # notifications
            pavucontrol            # audio control
            glib                   # used for gsettings
            swaybg                 # wallpaper manager
          ];

          fonts = {
                  packages = with pkgs; [
                          font-awesome
                          noto-fonts
                  ];
          };

        #   gtk = {
        #           enable = true;
        #           theme = {
        #                   name = "Materia-dark";
        #                   package = pkgs.materia-theme;
        #           };
        #   };


  };
}
