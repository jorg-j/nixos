{ config, pkgs, ... }:
{

programs.ssh.knownHosts = {
    "gitlab.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf";
  };

services.self-deploy = {
    enable = true;
    branch = "main";
    startAt = "minutely";
    repository = "git@gitlab.com:jorgensen-j/nixos.git";
    # nixFile = "/nix/${config.system.name}.nix";
    nixFile = "/hosts/vm_conf.nix";
    
};

}