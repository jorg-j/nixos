{ config, pkgs, ... }:

{
  imports = [
      ./aliases.nix
      ./scripts.nix
      ./time_local.nix
      ./keymap.nix
      ./sound.nix
      ./power_manage.nix
  ];
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Disable Sudo password on wheel users
  security.sudo.wheelNeedsPassword = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes and nix-command
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

environment = {
    systemPackages = with pkgs;
    [
      cryfs
      gocryptfs
      just
      libnotify
      unison
    ];
  };
}
