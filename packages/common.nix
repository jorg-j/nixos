{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
     # system tools


      file

      tmux
      libnotify
    # Screen Recording
      kooha


    # FileSys
      fd

      rsync


    ];

    services.udev.packages = [ pkgs.libu2f-host ];

    environment.etc."gitconfig".text = ''
    [user]
        name = jorg-j
        email = jorgensen.server@gmail.com
    '';
}
