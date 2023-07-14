
{ config, pkgs, ... }:
{
  services = {
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "jack";
      group = "users";
      guiAddress = "0.0.0.0:8384";

      dataDir = "/home/jack/Documents";
      configDir = "/home/jack/.config/syncthing";
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
      overrideFolders = true;     # overrides any folders added or deleted through the WebUI
      devices = {
        "pop-os" = { id = "RLA44QX-QSJCR7D-FEJ562P-A443ZN5-TETSA3X-VY6SVUO-RHLRXWS-PLNPLAV"; };
        "nas" = { id = "TOHCWTZ-SP64XIM-V4CZ537-YQTDRC2-6D6JOVT-QHQQQ5J-H6HZK3G-JMHEPAN"; };
        };
      folders = {
        "Documents" = {        # Name of folder in Syncthing, also the folder ID
          path = "/home/jack/Documents";    # Which folder to add to Syncthing
          devices = [ "pop-os" "nas" ];      # Which devices to share the folder with
          };
        };

      };
    };

  services.syncthing.extraOptions.gui = {
    user = "jack";
    password = "syncthing";
};

  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
