{ config, pkgs, ... }:

{
    imports = [
        ./aliases.nix
        ./scripts.nix
        ./time_local.nix
        ./keymap.nix
        ./wifi.nix
    ];
    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Disable Sudo password on wheel users
    security.sudo.wheelNeedsPassword = false;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # # Enable networking
    networking.networkmanager.enable = true;

}