
{ config, pkgs, lib, ... }:

{
  # Ensure Gitea runner is available as a system package
  environment.systemPackages = with pkgs; [ gitea-actions-runner ];

  services.gitea-actions-runner.instances.hp = {
    enable = true;
    url = "https://192.168.1.122:3100/";
    token = "wzFYhfr00VtQeBCXUoFigdSsC0dkvtltEZ2Iqak0";
    name = "hp";
    labels = [
        # provide a debian base with nodejs for actions
        "debian-latest:docker://node:18-bullseye"
        # fake the ubuntu name, because node provides no ubuntu builds
        "ubuntu-latest:docker://node:18-bullseye"
        # provide native execution on the host
        #"native:host"
        ];
    settings = """
    runner:
        insecure: true
    """;
    };

}

