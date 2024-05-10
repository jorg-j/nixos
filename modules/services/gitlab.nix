{
  config,
  pkgs,
  lib,
  ...
}: {
services.gitlab = {
  enable = true;
  port = 5454;
  databasePasswordFile = pkgs.writeText "dbPassword" "zgvcyfwsxzcwr85l";
  initialRootPasswordFile = pkgs.writeText "rootPassword" "dakqdvp4ovhksxer";
  secrets = {
    secretFile = pkgs.writeText "secret" "Aig5zaic";
    otpFile = pkgs.writeText "otpsecret" "Riew9mue";
    dbFile = pkgs.writeText "dbsecret" "we2quaeZ";
    jwsFile = pkgs.runCommand "oidcKeyBase" {} "${pkgs.openssl}/bin/openssl genrsa 2048 > $out";
  };
};

services.nginx = {
  enable = true;
  recommendedProxySettings = true;
  virtualHosts = {
    localhost = {
      locations."/".proxyPass = "http://unix:/run/gitlab/gitlab-workhorse.socket";
    };
  };
};

services.openssh.enable = true;

systemd.services.gitlab-backup.environment.BACKUP = "dump";

}