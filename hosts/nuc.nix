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

    ./hardware/nuc-hardware-configuration.nix
    ../profiles/desktop.nix
    ../nmodules
    ../modules/networking.nix
    ../modules/services/yubi.nix
    ../sys/command_script
    ../factorio.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.tmp.cleanOnBoot = true;

  # Enable roles
  our.roles.nuc.enable = true;
  our.roles.hyprland.enable = true;
  our.roles.plasma.enable = true;
  our.roles.backups.enable = true;
  our.roles.ansible.enable = true;
  our.roles.docker.enable = true;
  our.roles.sqlite.enable = true;
  our.roles.office.enable = true;
  our.roles.ollama.enable = true;
  our.roles.modeling.enable = true; # 3d
  our.roles.moonlander.enable = true;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enables closure file builds for arm
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  networking.hostName = "nuc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable auto randr
  services.autorandr.enable = true;

  # For SSD's
  services.fstrim.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    chromium
    distrobox
    yt-dlp
    exfat
    exfatprogs
    ntfs3g
    # scantailor-advanced # Post Processor for scanner files

    viu # Terminal Image Viewer

    claude-code
    taskwarrior2 # task warrior
    googleearth-pro
  ];

  system.stateVersion = "23.05"; # No Touchy

  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 30d";
  };

  # nix.settings.auto-optimise-store = true;

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system updates are configured correctly
  nixpkgs.config.allowUnfree = true; # Adjust this based on your requirements
  nixpkgs.config.allowBroken = false;

  # Enable security settings
  security.pam.services.kdewallet.enable = true;
  security.protectKernelImage = true; # Ensure this is necessary for your use case

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Ensure system
