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

      file
      jq
      nmap
      wget
      curl
      aria2

      bat
      tmux
      libnotify
    # Screen Recording
      kooha

    # Web
      firefox

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

    environment.etc."gitconfig".text = ''
    [user]
        name = jorg-j
        email = jorgensen.server@gmail.com
    '';
}
