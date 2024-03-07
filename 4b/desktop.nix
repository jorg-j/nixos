{
  config,
  pkgs,
  ...
}: {
  # === Setup Desktop Environment ===
  # Enable X11 windowing system
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["modesetting"];

  # Enable Desktop Environment

  services.xserver.desktopManager.xfce.enable = true;

  # Enable slim autologin
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.user = "jack";
}
