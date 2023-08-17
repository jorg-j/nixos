{
  network.description = "NixOps deployment";
  network.enableRollback = true;

  network.storage.legacy = {
    databasefile = "~/.nixops/deployments.nixops";
  };

  surface =
    { config, pkgs, ... }:
    { deployment.targetHost = "192.168.1.148";
    };
}