{ config
, pkgs
, ...
}: {
  environment.systemPackages = with pkgs; [
    zsh
  ];
  programs.zsh = {
    enable = true;
  };

  environment.variables = {
    PATH = "${pkgs.zsh}/bin:$HOME/bin";
  };
}
