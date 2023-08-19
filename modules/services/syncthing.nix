{ config, pkgs, user, machine1_name, machine1_id, machine2_id, machine2_name, ... }:
{
  services = {
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "${user}";
      group = "users";
      guiAddress = "0.0.0.0:8384";

      dataDir = "/home/${user}/Documents";
      configDir = "/home/${user}/.config/syncthing";
      overrideDevices = true; # overrides any devices added or deleted through the WebUI
      overrideFolders = true; # overrides any folders added or deleted through the WebUI
      devices = {
        ${machine1_name} = { id = "${machine1_id}"; };
        ${machine2_name} = { id = "${machine2_id}"; };
      };
      folders = {
        "Documents" = {
          # Name of folder in Syncthing, also the folder ID
          path = "/home/${user}/Documents"; # Which folder to add to Syncthing
          devices = [ "${machine1_name}" "${machine2_name}" ]; # Which devices to share the folder with
        };
      };

    };
  };

  services.syncthing.extraOptions.gui = {
    user = "${user}";
    password = "syncthing";
  };

  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
