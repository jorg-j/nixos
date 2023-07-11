{ config, pkgs, ... }:
{



services.self-deploy = {
    enable = true;

    startAt = "minutely";
    repository = "git@gitlab.com:jorgensen-j/nixos.git";
    # nixFile = "/nix/${config.system.name}.nix";
    nixFile = "/nix/hosts/vm_conf.nix";
    nixAttribute = "system";
    branch="main";
};

}