{ config, lib, ... }:
{
  network.description = "NixOps deployment";
  network.enableRollback = true;

  network.storage.legacy = {
    databasefile = "~/.nixops/deployments.nixops";
  };

  network.hosts = {
  surface =
    {
    deployment.targetHost = "192.168.1.148";
    system = config.system.build.toplevel;
    };
    };
}
