{ config, pkgs, lib, ... }:

let
  SSID = "Poop Emoji";
  SSIDpassword = "6726e644af73b1b641c8c1d74168ef8ae517280d34539f5c180afc22f38c4d91";
  interface = "wlan0";
  hostname = "nixpi";
in
{

  imports = [
    ./sys
    ./user.nix
    # ./python.nix
    # ./desktop.nix
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

  # === Configure keymap in X11 ===
  services.xserver = {
    layout = "au";
    xkbVariant = "";
  };

  # === Config ssh ===
  services.openssh.enable = true;
  services.openssh.settings.permitRootLogin = "yes";

  system.stateVersion = "23.11";
}
