{ config, pkgs, lib, ... }:
{

  # === Configure Boot for RPi 3 ===  
  boot.loader.grub.enable = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelParams = ["cma=256M"];
  boot.loader.generic-extlinux-compatible.enable = true;
  boot.loader.raspberryPi.enable = true;
  boot.loader.raspberryPi.version = 3;
  boot.loader.raspberryPi.uboot.enable = true;
  boot.loader.raspberryPi.firmwareConfig = ''
    gpu_mem=256
  '';
  
  
  # === Firmware Modifications ===
  # Prevent Wifi from roasting
  hardware.enableRedistributableFirmware = false;
  hardware.firmware = [ pkgs.raspberrypiWirelessFirmware ];
 

  # === Increase Swap to prevent crashing ===
  swapDevices = [ { device = "/swapfile"; size = 1024; } ];


  # === Package Management ===
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [
    raspberrypi-tools
    vim
    git
    htop
    dhcpcd
    wpa_supplicant
  ];


  # === Configure File System ===
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };


  # === Optimise storage ===
  documentation.nixos.enable = false;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
  boot.cleanTmpDir = true;
  time.timeZone = "Australia/Melbourne";
  
  
  # === Config ssh ===
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";

  # === Setup Users ===
  users.users = {
    root = {};
    pi = {
      isNormalUser = true;
      home = "/home/nixos";
      extraGroups = [ "wheel" "networkmanager" ];
      # password = "";
      hashedPassword = "$6$MAri.IIplRr.ipPQ$F4iKBI4WTv3Bie2zsUO2g7UabOKJFNk8Dnf1rrqkcE7jc/0Crn.TXaoywOjVMCiJAj1khrGAlmDC2baNt3exq1";
    };
  };

  # === Setup Alias ===
  environment.interactiveShellInit = ''
    alias config='sudo vim /etc/nixos/vonfiguration.nix'
    alias update='sudo nixos-rebuild switch'
    alias sync='curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/rpi3.nix | tee /home/pi/configuration.nix'
    alias upgrade = 'sudo cp /home/pi/configuration.nix /etc/nixos/configuration.nix'
    alias clean='sudo nix-collect-garbage -d'
  '';

  # === Setup Wifi ===

  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    networks = {
      zelda = {
        pskRaw = "1dfbc34490b8e2d7c426e97371edc8f1e0d995a5c50b39be059f0609dd0fd668";
      };
    };
  };
  
  
  # === Setup Desktop Environment ===
  # Enable X11 windowing system
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  # Enable xfce
  services.xserver.desktopManager.xfce.enable = true;

  # Enable slim autologin
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.user = "pi";

}
