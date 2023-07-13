
{ config, pkgs, ... }:
{
services = {
  syncthing = {
    enable = true;
    dataDir = "/home/jack/Documents";
    configDir = "/home/jack/Documents/.config/syncthing";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    devices = {
      "pop-os" = { id = "RLA44Q"; };

    };
    folders = {
      "Documents" = {        # Name of folder in Syncthing, also the folder ID
        path = "/home/jack/Documents";    # Which folder to add to Syncthing
        devices = [ "pop-os" ];      # Which devices to share the folder with
      };

      };
    };
  };
}
