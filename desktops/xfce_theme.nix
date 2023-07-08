{ config, pkgs, ... }:

let

  xfce_config = pkgs.writeScriptBin "xfce_config" ''
    #!${pkgs.stdenv.shell}
    mkdir -p ~/.config
    tar -xvzf /etc/nixos/desktops/xfce.tar.gz -C ~/.config
  '';

in
{
  environment.systemPackages = [
    xfce_config
  ];


  # system.activationScripts.script.text = ''
  #     #!/bin/bash
  #     source ${config.system.build.setEnvironment}
  #     echo "-------------------------------------"
  #     echo "Run xfce_config to install xfce theme"
  #     echo "-------------------------------------"
  #     '';

}

