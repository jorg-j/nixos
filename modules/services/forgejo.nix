{
  config,
  pkgs,
  lib,
  ...
}: {
  users.users.gitea-runner = {
    isSystemUser = true;
    group = "gitea-runner";
    extraGroups = ["docker"];
  };
# Notes:
# forgejo is setup on the nas at 3100
# if needing to reinstall or re-init the following changes must be made post install
# 1. update the app.ini file
# 1.1 docker exec -it Forgejo sh
# 1.2 vi /data/gitea/conf/app.ini
# 1.3 insert the below
# [migrations]
# ALLOWED_DOMAINS = *
# ALLOW_LOCALNETWORKS = true
# SKIP_TLS_VERIFY = true
# BLOCKED_DOMAINS =

# [actions]
# ENABLED = true
# 1.4 enable actions inside each repo which should have permissions for it. This is done in the settings -> units -> overview

# 2. add the token to the runner
# 2.1 get the runner token from the system admin page
# 2.2 create the token at the tokenFile location as listed below (TODO this should be moved)
# 2.3 set chown to gitea-runner:gitea-runner
# 2.4 set chmod to 600

  users.groups.gitea-runner = {};
  services.gitea-actions-runner = {
    package = pkgs.forgejo-runner; # optional, defaults to act_runner
    instances = {
      "runner" = {
        name = "hp_server_runner";
        enable = true;
        url = "http://192.168.1.122:3100/";
        tokenFile = "/home/jack/forgejo-runner-token"; # path to a file containing the token
        labels = [
          "ubuntu-latest:docker://node:16-bullseye"
          "ubuntu-22.04:docker://node:16-bullseye"
          "nix:host" # run jobs directly on the host
        ];
        settings = {
          runner.fetch_timeout = "30s";
          container.network = "bridge";
        };
      };
    };
  };
}
