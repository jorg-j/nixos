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
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.tmp.cleanOnBoot = true;

  # TODO todoist service needs to be updated to latest
  services.todoist_load = {
    enable = false;
  };

  our.roles.nuc.enable = true;
  #our.roles.i3.enable = true;
  #our.roles.hyprland.enable = true;
  our.roles.plasma.enable = true;


  services.duckypad.enable = true;
  our.software.backups.enable = true;
  our.software.ansible.enable = true;
  our.software.docker.enable = true;
  our.software.vagrant.enable = true;
  our.software.sqlite.enable = true;
  our.software.office.enable = true;
  our.software.ollama.enable = true;
  # our.software.vnc.enable = true;
  our.software.modeling.enable = true; # 3d
  # our.software.moonlander.enable = true;

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

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    chromium
    distrobox
    yt-dlp
    exfat
    exfatprogs
    ntfs3g
    scantailor-advanced
    wofi
    pcmanfm-qt
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
}
