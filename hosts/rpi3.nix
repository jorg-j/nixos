{ config, pkgs, lib, ... }:
{
  imports =
    [ 
      ../modules/hardware/3b-hardware-configuration.nix

      ../profiles/server.nix

      # DO NOT REMOVE
      ../sys/wifi.nix

      ../modules/users/jack.nix

      # ../users/pi.nix
    ];

  # === Package Management ===
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [
    #raspberrypi-tools
    libraspberrypi
    vim
    git
    htop
    dhcpcd
    wpa_supplicant
    borgbackup
    unison
  ];

  # === Optimise storage ===
  documentation.nixos.enable = false;
  # nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
  # boot.cleanTmpDir = true;
  time.timeZone = "Australia/Melbourne";
  
  
  # === Config ssh ===
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";


  # === Setup Desktop Environment ===
  # Enable X11 windowing system
  # services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "modesetting" ];

  networking.hostName = "tenant";

  # Enable Desktop Environment

  # services.xserver.desktopManager.xfce.enable = true;
 

  # Enable slim autologin
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.displayManager.lightdm.autoLogin.enable = true;
  # services.xserver.displayManager.lightdm.autoLogin.user = "jack";
  system.stateVersion = "19.09";
}
