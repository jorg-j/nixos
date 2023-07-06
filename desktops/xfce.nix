{ config, pkgs, lib, ... }:

{# Enable XFCE

#   services.xserver = {
#     desktopManager = {
#       xterm.enable = false;
#       xfce.enable = true;
#     };
#     displayManager.defaultSession = "xfce";
#   };
services.xserver = {
  # ... Other X server options ...

  # Set the GTK theme
  windowManager.default = "startxfce4";
  displayManager.xfce.enable = true;
  desktopManager.xfce.enable = true;
  desktopManager.xfce.windowManager.default = "xfwm4";
  desktopManager.xfce.enableContribPlugins = true;
  desktopManager.xfce.extraPackages = with pkgs; [
    # ... Other Xfce packages ...
    gtk3
  ];

  environment.systemPackages = with pkgs; [
    # ... Other system packages ...
    adwaita-maia-theme
  ];

  systemd.user.services = {
    "xfsettingsd" = {
      enable = true;
      path = with pkgs.xorg; [ xfsettingsd ];
    };
  };
};

}