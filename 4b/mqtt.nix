{
  config,
  pkgs,
  lib,
  ...
}: {
  services.mosquitto = {
    enable = true;
    listeners = [
      {
        acl = ["pattern readwrite #"];
        omitPasswordAuth = true;
        settings.allow_anonymous = true;
      }
    ];
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [1883];
  };
}
