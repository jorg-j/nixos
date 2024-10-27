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

      dpi = 200;
      upscaleDefaultCursor = false;


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


  environment.variables = {
    GDK_SCALE = "1"; # default 1 I think
    GDK_DPI_SCALE = "1"; # default 1 I think
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=1"; # default 1 I think
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    XCURSOR_SIZE = "32"; # default 16 I think
  };



    environment.systemPackages = with pkgs; [
      xfce.thunar
      lxappearance
      pcmanfm-qt
      dunst # notifications
      picom
      nitrogen
      dolphin
      gnome.nautilus
      bashmount
      udiskie
      feh
      xautolock
      font-awesome
      gnome-system-monitor

      # bumblebee-status, plugins need to be set as package overrides
      # packages are located here: https://github.com/NixOS/nixpkgs/pull/254772/commits/51e20bb809fbe921095d90fb29bce74ec17dc684
      (pkgs.bumblebee-status.override {
      plugins = p: [p.cpu p.nic p.dunstctl];  
      })
      
    ];


  };
}
