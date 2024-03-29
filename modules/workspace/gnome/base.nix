{
  pkgs,
  lib,
  ...
}: {
  # Enable a low-level configuration system and settings
  # management tool. Its main purpose is to provide a back end
  # to GSettings on platforms that don't already have
  # configuration storage systems. It is part of GNOME 3 and is
  # a replacement for GConf
  programs.dconf.enable = true;

  services = {
    # Packages whose D-Bus configuration files should be included
    # in the configuration of the D-Bus system-wide or
    # session-wide message bus
    dbus.packages = with pkgs; [dconf];

    # Provides geolocation services, that is, it lets
    # applications find the user's geographical position.
    # A mapping application could use this to present a
    # "where am # I" view, for example
    geoclue2.enable = false;

    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    gnome = {
      core-os-services.enable = true;
      core-utilities.enable = true;
      evolution-data-server.enable = true;
      sushi.enable = true;
      tracker.enable = false;
      tracker-miners.enable = false;
      gnome-settings-daemon.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
      gnome-online-miners.enable = true;
    };
  };

  environment.sessionVariables.XDG_CURRENT_DESKTOP = "X-Generic";

  home-manager.users.jack = {
    # home.activation.gnome = ''
    #   $DRY_RUN_CMD mkdir -p "$XDG_DATA_HOME/.npm-packages"
    # '';

    dconf.settings = {
      "org/gnome/nautilus/icon-view" = {
        captions = ["size" "date_modified" "none"];
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "close,minimize,maximize:appmenu";
        num-workspaces = 10;
      };

      "org/gnome/nautilus/list-view" = {
        default-column-order = [
          "name"
          "size"
          "type"
          "owner"
          "group"
          "permissions"
          "where"
          "date_modified"
          "date_modified_with_time"
          "date_accessed"
          "recency"
          "starred"
          "detailed_type"
        ];
        default-visible-columns = ["name" "size" "date_modified" "starred"];
      };

      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        executable-text-activation = "display";
        search-filter-time-type = "last_modified";
        search-view = "list-view";
        show-image-thumbnails = "always";
        thumbnail-limit = 10;
      };

      "org/gnome/desktop/interface" = {cursor-theme = "default";};

      "org/gnome/evince/default" = {inverted-colors = true;};

      "org/gnome/maps" = {
        night-mode = true;
        transportation-type = "car";
      };
    };
    gtk = {
      enable = true;

      #iconTheme = {
      #  name = "Papirus-Dark";
      #  package = pkgs.papirus-icon-theme;
      #};

      #theme = {
      #  name = "palenight";
      #  package = pkgs.palenight-theme;
      #};

      # cursorTheme = {
      #   name = "Numix-Cursor";
      #   package = pkgs.numix-cursor-theme;
      # };

      #gtk3.extraConfig = {
      #  Settings = ''
      #    gtk-application-prefer-dark-theme=1
      #  '';
      # };

      #gtk4.extraConfig = {
      #  Settings = ''
      #    gtk-application-prefer-dark-theme=1
      #  '';
    };
  };
  #home.sessionVariables.GTK_THEME = "palenight";
}
