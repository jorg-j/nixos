
{ config, pkgs, user, machine1_name, machine1_id, machine2_id, machine2_name, ... }:
{

  services = {
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "jack";
      group = "users";
      guiAddress = "0.0.0.0:8384";

      dataDir = "/home/jack/Syncthing_Data";
      configDir = "/home/jack/.config/syncthing";
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
      overrideFolders = true;     # overrides any folders added or deleted through the WebUI
      devices = {
        "popos" = { id = "RLA44QX-QSJCR7D-FEJ562P-A443ZN5-TETSA3X-VY6SVUO-RHLRXWS-PLNPLAV"; };
        "tenant" = { id = "YQEWDFD-7X5FALF-JJ7IWYJ-IDON2X6-NOO4VMI-EFCHTHV-EVP2ZQK-RUR25A2"; };
        };
      folders = {
        "Documents" = {        # Name of folder in Syncthing, also the folder ID
          path = "/home/jack/Documents";    # Which folder to add to Syncthing
          devices = [ "popos", "tenant" ];      # Which devices to share the folder with
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
