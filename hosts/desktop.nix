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

    ./hardware/desktop-hardware-configuration.nix
    ../modules/dev
    ../modules/security.nix
    ../modules/apps/editor/vim.nix
    ../sys
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;
  boot.tmp.cleanOnBoot = true;

  users.users.jack = {
    isNormalUser = true;
    uid = 1000;
    description = "Jack";
    home = "/home/jack";
    extraGroups = [
      "docker"
      "podman"
      "syncthing"
      "wheel"
      "networkmanager"
      "vboxusers"
      "dialout"
    ];

    createHome = true;
    # password = "";
    hashedPassword = "$6$MAri.IIplRr.ipPQ$F4iKBI4WTv3Bie2zsUO2g7UabOKJFNk8Dnf1rrqkcE7jc/0Crn.TXaoywOjVMCiJAj1khrGAlmDC2baNt3exq1";
    shell = pkgs.zsh;
  };

  # Activate gpg
  programs.gnupg.agent.enable = true;

  our.software.docker.enable = true;

  our.software.sqlite.enable = true;

  # Enables closure file builds for arm
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  networking.hostName = "desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable auto randr
  services.autorandr.enable = true;

  # For SSD's
  services.fstrim.enable = true;

  # Enable ZSA Moonlander hardware flashing
  hardware.keyboard.zsa.enable = true;

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    chromium
    yt-dlp
    mc
    pkgs.gnumake

    python311Full # Python 3.11
    python311Packages.pip
    python311Packages.virtualenv
    python311Packages.setuptools
    python311Packages.black
    python311Packages.pytest
    python311Packages.isort
    python3Packages.requests
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;
}
