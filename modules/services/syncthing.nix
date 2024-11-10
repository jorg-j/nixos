{
  config,
  pkgs,
  user,
  machine1_name,
  machine1_id,
  machine2_id,
  machine2_name,
  ...
}: {
  services = {
    syncthing = {
      enable = true;
      user = "jack";
      dataDir = "/home/jack/"; # Default folder for new synced folders
      configDir = "/home/jack/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };
}
