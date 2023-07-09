{ config, pkgs, lib, ... }:

{# Enable XFCE

services.xserver.enable = true;
services.xserver.desktopManager.budgie.enable = true;
services.xserver.displayManager.lightdm.enable = true;


}

