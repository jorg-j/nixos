{ config, pkgs, lib, ... }:

{# Enable Plasma

services.xserver.enable = true;
services.xserver.displayManager.sddm.enable = true;
services.xserver.desktopManager.plasma5enable = true;
        

}

