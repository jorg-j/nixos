{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./kitty.nix
    ./tmux.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      xterm
      xfce.xfce4-terminal
    ];
  };
}