{
  config,
  pkgs,
  ...
}: {


  services.rabbitmq = {
    enable = true;
    listenAddress = "0.0.0.0";
    managementPlugin = {
      enable = true;
      port = 15672;
    };
  };
  networking.firewall.allowedTCPPorts = [ 5672 15672 ];
}
