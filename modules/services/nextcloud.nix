{ config, pkgs, lib, ... }:

let
  myhost = "jorgensenj.duckdns.org";

in
{
  services.nextcloud = {
    enable = true;
    hostName = myhost;
    https = true;
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql";
      dbname = "nextcloud";
      adminuser = "root";
      adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
    };
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [
      {
        name = "nextcloud";
        ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
      }
    ];
  };

  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      myhost = {
        forceSSL = true;
        enableACME = true;
      };
    };
  };
  #   services.nextcloud = {
  #     enable = true;
  #     package = pkgs.nextcloud27;
  #     hostName = "0.0.0.0";
  #     config.adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
  #   };

  #   networking.firewall = {
  #     enable = true;
  #     allowedTCPPorts = [ 80 443 ];
  #   };

  #   services.nginx = {
  #     enable = true;
  #     virtualHosts."nextcloud.home" = {
  #       locations."/".proxyPass = "http://127.0.0.1:8080";
  #       extraConfig = ''
  #         allow 192.168.0.1/24;
  #         deny all;
  #       '';
  #     };
  #   };
}
