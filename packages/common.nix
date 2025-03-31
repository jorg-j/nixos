{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # system tools
    file
    tmux
    htop


    # FileSys
    fd
    rsync
  ];

  services.udev.packages = [pkgs.libu2f-host];
}
