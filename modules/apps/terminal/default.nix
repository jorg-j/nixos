{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./kitty.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      xterm
      xfce.xfce4-terminal
    ];
  };
}