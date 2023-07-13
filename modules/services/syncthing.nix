
{ config, pkgs, ... }:
{
  services = {
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "jack";
      guiAddress = "0.0.0.0:8384";

      dataDir = "/home/jack/Documents";
      configDir = "/home/jack/Documents/.config/syncthing";
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

      versioning = {
        type = "staggered";
        params = {
          cleanInterval = "3600"; # 1 hour in seconds
          maxAge = "2592000"; # 30 days in seconds
          };
        };

      };
    };
}
