{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libqalculate # Terminal Calculator
    gparted

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

    yad # yet another dialog box

    tmsu # tag my stuff utility

    popsicle # usb flash

    caffeine-ng
  ];
}
