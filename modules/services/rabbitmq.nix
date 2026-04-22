{
  config,
  pkgs,
  ...
}: {

  services.rabbitmq = {
    enable = true;
    managementPlugin.enable = true; # optional, for the UI on :15672
  };
  services.rabbitmq.configItems = {
    "management.listener.ip" = "0.0.0.0";
  };
}
