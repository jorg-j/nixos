
{
  imports = [
    ./base.nix
    # ../modules/workspace/gnome
  ];

  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
  };

}