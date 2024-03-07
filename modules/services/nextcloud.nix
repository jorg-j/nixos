{
  config,
  pkgs,
  lib,
  ...
}: {
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud27;
    hostName = "0.0.0.0";
    config = {
      adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
      extraTrustedDomains = ["192.168.1.*"];
    };
    phpOptions = {
      upload_max_filesize = "2G";
      post_max_size = "2G";
    };
    configureRedis = true;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443];
  };

  services.nginx = {
    enable = true;
    virtualHosts."nextcloud.home" = {
      locations."/".proxyPass = "http://127.0.0.1:8080";
      extraConfig = ''
        allow 192.168.0.1/24;
        deny all;
      '';
    };
  };
}
