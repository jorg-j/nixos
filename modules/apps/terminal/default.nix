{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./kitty.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      kitty
      xterm
      xfce.xfce4-terminal
      xdotool
      tmux
    ];
  };
}
