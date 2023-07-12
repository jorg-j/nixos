{ config, pkgs, lib, ... }:

{

# imports =
    # [ 
    #   ./gnome_extensions.nix
    # ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
        

}
