{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zlib
    zip
    unzip
    bzip2
    zstd
    unrar
    atool
    archiver
    zpaq # compression

    rar
    par2cmdline


  ];
}
