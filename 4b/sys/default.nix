{ config, pkgs, ... }:

{
  imports = [
    ../../sys/aliases.nix
    ./scripts.nix
    ./time_local.nix
  ];
  # === Enable the OpenSSH Daemon ===
  services.openssh.enable = true;

  # === Disable Sudo password on wheel users ===
  security.sudo.wheelNeedsPassword = false;

  # === Allow unfree packages ===
  nixpkgs.config.allowUnfree = true;

}
