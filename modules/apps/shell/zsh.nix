{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zsh
    zellij
  ];
  programs.zsh = {
    enable = true;
  };

  environment.variables = {
    PATH = "${pkgs.zsh}/bin:$HOME/bin:$HOME/.cargo/bin";
  };
}
