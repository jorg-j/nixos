{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs;
    [
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
    theme = "afowler";

  };

}
