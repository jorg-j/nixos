{ config, pkgs, lib, ... }:

with lib; let

  cfgNuc = config.our.roles.nuc;
  cfgHP = config.our.roles.hpserver;
  cfgLaptop = config.our.roles.hplaptop;
in
{
  home-manager.users.jack = {
    home.packages = with pkgs;
      if cfgNuc.enable then

        [
          abiword
          gnumeric
          # obsidian
          todoist-electron
          # === libreoffice ===
          hunspell
          hunspellDicts.en_US-large
          libreoffice-fresh
        ] else if cfgHP.enable then
        [ abiword ]
        else if cfgLaptop.enable then
        [ 
          # === libreoffice ===
          hunspell
          hunspellDicts.en_US-large
          libreoffice-fresh
          abiword
         ]
      else
        [ abiword ];


  };
}
