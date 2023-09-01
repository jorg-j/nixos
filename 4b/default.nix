{ config, pkgs, lib, ... }:

{

  imports = [
    ./sys
    ./user.nix
    ../wifi.nix
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

  # networking = {
  #   hostName = hostname;
  #   wireless = {
  #     enable = true;
  #     networks."${SSID}".psk = SSIDpassword;
  #     interfaces = [ interface ];
  #   };
  # };


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
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  system.stateVersion = "23.11";
}
