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

    ./hardware/hp-hardware-configuration.nix
    ../profiles/hpserver.nix
    ../nmodules
    ../nmodules/e_ink.nix
    ../modules/networking.nix
    ../sys/insecure_packages.nix
    # ../modules/services/wireguard.nix
    # ../modules/services/gitea.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.tmp.cleanOnBoot = true;

  # Enables closure file builds for arm
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  our.roles.hpserver.enable = true;
  # services.immichbackup.enable = true;
  our.software.sqlite.enable = true;
  our.software.docker.enable = true;
  our.software.ansible.enable = true;

  networking.hostName = "hpserver"; # Define your hostname.
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
    archivebox
  ];

  system.stateVersion = "23.05"; # No Touchy

  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 30d";
  };

  nixpkgs.config.permittedInsecurePackages = [
    "python3.11-django-3.1.14" # archivebox
    "python3.12-django-3.1.14"
    "archiver-3.5.1"
  ];

  # nix.settings.auto-optimise-store = true;

  # Desktop

  # Enable random binaries to run
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];



  # The below is todoist autotools - This should be moved into its own file at some point


  systemd.services.todoistautotools-docker-compose = {
    serviceConfig = {
      Type = "oneshot";
      WorkingDirectory = "/home/jack/Docker/Todoist_Autotools";
    };
    script = ''
    ${pkgs.docker-compose}/bin/docker-compose -f docker-compose.yml up --detach
    '';
  };

  systemd.timers.todoistautotools-docker-compose = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = [
        # Weekdays 8am-6pm every 15 minutes
	"Mon..Fri *-*-* 00:00:00,03:00:00,06:00:00,07:45:00"
	#"Mon..Fri *-*-* 08:00:00..18:00:00/15min"
        # Off-hours schedule (weekdays outside 8-6 and weekends)
	"Mon..Fri *-*-* 18:30:00,21:00:00,23:00:00"
        #"Mon-Fri 00:00-08:00/3:00"
        #"Mon-Fri 18:00-24:00/3:00"
        # "Sat,Sun 00/3:00"
	"Sat..Sun *-*-* 01:00:00..23:00:00/50min"
      ];
      Persistent = true;
      Unit = "todoistautotools-docker-compose.service";
    };
  };

  # Note to Future me: you can use the following command to check the timer syntax is being parsed correctly
  # systemd-analyze calendar --iterations=5 "Mon,Fri 6,7:0/5:00"
}
