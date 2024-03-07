{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.our.roles.pantheon;
in {
  imports = [
    ./qt-style.nix
  ];

  options.our.roles.pantheon = {
    enable = mkEnableOption "pantheon";
  };

  config = mkIf cfg.enable {
    # Exclude the elementary apps I don't use
    environment = {
      pantheon.excludePackages = with pkgs.pantheon; [
        elementary-music
        elementary-photos
        elementary-videos
        epiphany
      ];

      # App indicator
      # - https://discourse.nixos.org/t/anyone-with-pantheon-de/28422
      # - https://github.com/NixOS/nixpkgs/issues/144045#issuecomment-992487775
      pathsToLink = ["/libexec"];

      # Add additional apps and include Yaru for syntax highlighting
      systemPackages = with pkgs; [
        appeditor # elementary OS menu editor
        celluloid # Video Player
        formatter # elementary OS filesystem formatter
        gthumb # Image Viewer
        gnome.simple-scan # Scanning
        indicator-application-gtk3 # App Indicator
        pantheon.sideload # elementary OS Flatpak installer
        torrential # elementary OS torrent client
        yaru-theme
      ];
    };

    # Add GNOME Disks, Pantheon Tweaks and Seahorse
    programs = {
      gnome-disks.enable = true;
      pantheon-tweaks.enable = true;
      seahorse.enable = true;
    };

    services = {
      flatpak = {
        enable = true;
      };
      pantheon.apps.enable = true;

      xserver = {
        enable = true;
        displayManager = {
          lightdm.enable = true;
          lightdm.greeters.pantheon.enable = true;
        };

        desktopManager = {
          pantheon = {
            enable = true;
            extraWingpanelIndicators = with pkgs; [
              monitor
              wingpanel-indicator-ayatana
            ];
          };
        };
      };
    };

    # App indicator
    # - https://github.com/NixOS/nixpkgs/issues/144045#issuecomment-992487775
    systemd.user.services.indicatorapp = {
      description = "indicator-application-gtk3";
      wantedBy = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = "${pkgs.indicator-application-gtk3}/libexec/indicator-application/indicator-application-service";
      };
    };
  };
}
