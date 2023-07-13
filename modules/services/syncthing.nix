
{ config, pkgs, ... }:
{
  services = {
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "jack";
      groups = "users";
      guiAddress = "0.0.0.0:8384";
      networking.firewall.allowedTCPPorts = [ 8384 22000 ];
      networking.firewall.allowedUDPPorts = [ 22000 21027 ];
      dataDir = "/home/jack/Documents";
      configDir = "/home/jack/.config/syncthing";
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
      overrideFolders = true;     # overrides any folders added or deleted through the WebUI
      devices = {
        "pop-os" = { id = "RLA44QX-QSJCR7D-FEJ562P-A443ZN5-TETSA3X-VY6SVUO-RHLRXWS-PLNPLAV"; };
        };
      folders = {
        "Documents" = {        # Name of folder in Syncthing, also the folder ID
          path = "/home/jack/Documents";    # Which folder to add to Syncthing
          devices = [ "pop-os" ];      # Which devices to share the folder with
        };

        };

      };
    };

    services.syncthing.extraOptions.gui = {
    user = "jack";
    password = "syncthing";
};
}
