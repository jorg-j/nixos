{ config, pkgs, ... }:
{
   # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  system.activationScripts.script.text = ''
      #!/bin/bash
      source ${config.system.build.setEnvironment}
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak update -y
      flatpak install vaults -y
      # flatpak install flathub com.valvesoftware.Steam -y
      '';
      
}