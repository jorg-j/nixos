{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs;
    [
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];
  programs.zsh = {
    enable = true;
  };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };


}
