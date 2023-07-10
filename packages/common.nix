{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
     # system tools
      fzf
      ripgrep
      sd
      gitAndTools.delta
      home-manager
      git
      gedit
      file
      jq
      nmap
      wget
      curl
      aria2
      imagemagick
      bat
      tmux
      libnotify

    # Monitoring
      htop
      neofetch

    # FileSys
      fd
      unzip
      unrar
      rsync

    # Secure
      bitwarden            # Password Manager
      bitwarden-cli        # Password Manager
    ];

    services.udev.packages = [ pkgs.libu2f-host ];
}