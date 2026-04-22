{
  config,
  pkgs,
  ...
}: {

  services.rabbitmq = {
    enable = true;
    managementPlugin.enable = true; # optional, for the UI on :15672
  };

}
