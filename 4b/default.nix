{ config, pkgs, lib, ... }:

let
  SSID = "Poop Emoji";
  SSIDpassword = "1dfbc34490b8e2d7c426e97371edc8f1e0d995a5c50b39be059f0609dd0fd668";
  interface = "wlan0";
  hostname = "nixpi";
in {

  imports = [
    ./sys
    ./user.nix
    # ./webhooks.nix
    #./mqtt.nix
    ./python.nix
  ];
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = hostname;
    wireless = {
      enable = true;
      networks."${SSID}".pskRaw = SSIDpassword;
      interfaces = [ interface ];
    };
  };


  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "23.11";

  # Packages
  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    dhcpcd
    wpa_supplicant
  ];

  # === Optimise storage ===
  documentation.nixos.enable = false;
  # nix.gc.automatic = true;
  #nix.gc.options = "--delete-older-than 30d";
  # boot.cleanTmpDir = true;
  time.timeZone = "Australia/Melbourne";


  # === Config ssh ===
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";


  # === Setup Desktop Environment ===
  # Enable X11 windowing system
  # services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "modesetting" ];

  # Enable Desktop Environment

  # services.xserver.desktopManager.xfce.enable = true;


  # Enable slim autologin
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.displayManager.lightdm.autoLogin.enable = true;
  # services.xserver.displayManager.lightdm.autoLogin.user = "jack";
 
}
