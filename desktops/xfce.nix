{ config, pkgs, lib, ... }:

{# Enable XFCE

  services.xserver = {
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };

  environment = {
    systemPackages = with pkgs; [
      xfce.xfce4-whiskermenu-plugin
    ];
  };


let

  xfce_config = pkgs.writeScriptBin "xfce_config" ''
    #!${pkgs.stdenv.shell}
    tar -xvzf /etc/nixos/desktops/xfce.tar.gz -C ~/.config
  '';

in
{
  environment.systemPackages = [
    xfce_config
  ];
}

}