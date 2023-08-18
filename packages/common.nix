{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
     # system tools
      file
      tmux

    # Screen Recording
      kooha

    # FileSys
      fd
      rsync
    ];

    services.udev.packages = [ pkgs.libu2f-host ];

}
