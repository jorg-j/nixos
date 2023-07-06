{ config, pkgs, ... }:


{
programs.zsh = {
  enable = true;
  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
};


programs.zsh = {
  ... # Your zsh config
 oh-my-zsh = {
    enable = true;
    plugins = [ "git" "thefuck" ];
    theme = "robbyrussell";
  };
};
}