{ config, pkgs, lib, ... }:
{
  imports =
    [ 
      ../hardware/3b-hardware-configuration.nix

      ../sys/aliases.nix
      ../sys/wifi.nix

      ../users/pi.nix
    ];

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

  # === Optimise storage ===
  documentation.nixos.enable = false;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
  boot.cleanTmpDir = true;
  time.timeZone = "Australia/Melbourne";
  
  
  # === Config ssh ===
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";


  # === Setup Desktop Environment ===
  # Enable X11 windowing system
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  # Enable Desktop Environment

  services.xserver.desktopManager.xfce.enable = true;
 

  # Enable slim autologin
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.user = "pi";

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia.theme;
    };
  };

}
