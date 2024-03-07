{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libqalculate # Terminal Calculator
    gparted
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

    yad # yet another dialog box
  ];
}
