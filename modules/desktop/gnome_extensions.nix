{pkgs, ...}: {
  home-manager.users.jack = {
    dconf = {
      enable = true;
      settings."org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          pop-shell.system76.com
        ];
      };
    };
  };

  # environment.systemPackages = with pkgs; [
  #   dconf
  # ];

  # dconf.settings = {
  #   # ...
  #   "org/gnome/shell" = {
  #     disable-user-extensions = false;

  #     # `gnome-extensions list` for a list
  #     enabled-extensions = [
  #       "user-theme@gnome-shell-extensions.gcampax.github.com"
  #       "trayIconsReloaded@selfmade.pl"
  #       "Vitals@CoreCoding.com"
  #       "dash-to-panel@jderose9.github.com"
  #       "sound-output-device-chooser@kgshank.net"
  #       "space-bar@luchrioh"
  #       "pop-shell@system76.com"
  #     ];
  #   };
  # };

  # home.packages = with pkgs; [
  #   # ...
  #   gnomeExtensions.user-themes
  #   gnomeExtensions.tray-icons-reloaded
  #   gnomeExtensions.vitals
  #   gnomeExtensions.dash-to-panel
  #   gnomeExtensions.sound-output-device-chooser
  #   gnomeExtensions.space-bar
  #   gnomeExtensions.pop-shell
  # ];
}
