# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    # <nixpkgs/nixos/modules/installer/scan/not-detected.nix>

    ./hardware/hp-laptop-hardware-configuration.nix
    ../profiles/hplaptop.nix
    ../nmodules
    ../modules/networking.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.tmp.cleanOnBoot = true;

  # Enables closure file builds for arm
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  our.roles.hpserver.enable = true;
  our.roles.hplaptop.enable = true;
  our.roles.lxqt.enable = true;

  our.software.sqlite.enable = true;
  our.software.docker.enable = true;

  networking.hostName = "hplaptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable auto randr
  services.autorandr.enable = true;

  # For SSD's
  services.fstrim.enable = true;

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  system.stateVersion = "23.05"; # No Touchy

  nix.gc = {
    automatic = true;
    dates = "monthly";
  };

  # nix.settings.auto-optimise-store = true;

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];


  }






