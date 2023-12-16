{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sqlite
    archiver
    binutils
    coreutils
    pciutils
    usbutils
    elfutils
    patchelf
    # util-linux
    bat
    # khal
    screenfetch
    tree
    libossp_uuid
    # dig
    wally-cli

    czkawka # Deduplication

    zpaq
  ];
}
