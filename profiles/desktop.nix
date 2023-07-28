
{
  imports = [
    ./base.nix
    # ../modules/workspace/gnome
  ];

  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    xournalpp
    gettext # needed for cinnamon
  ];
}