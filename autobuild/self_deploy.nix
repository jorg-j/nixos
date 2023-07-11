{ config, pkgs, ... }:
{

programs.ssh.knownHosts = [
  "/etc/ssh/ssh_known_hosts"
  "/home/jack/.ssh/known_hosts"
];

services.self-deploy = {
    enable = true;
    branch = "main";
    startAt = "minutely";
    repository = "git@gitlab.com:jorgensen-j/nixos.git";
    # nixFile = "/nix/${config.system.name}.nix";
    nixFile = "/hosts/vm_conf.nix";
    
};

}