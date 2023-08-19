{ config, pkgs, lib, ... }:

{
  imports = [ ];

  # === Configure Boot for RPi 3 ===  
  boot.loader.grub.enable = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelParams = ["cma=256M"];

  # If RPI boot not working enable this and disable uboot and try again
  # boot.loader.generic-extlinux-compatible.enable = true;
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
  swapDevices = [{ device = "/swapfile"; size = 1024; }];

  # === Configure File System ===
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };


}
