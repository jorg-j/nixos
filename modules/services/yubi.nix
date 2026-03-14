{
  config,
  pkgs,
  ...
}: {
  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [yubikey-personalization];
  hardware.gpgSmartcards.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # If you want Yubikey Manager
  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubioath-flutter
    yubico-piv-tool
    yubikey-personalization
    opensc
    cryptsetup
    pcsc-tools
    veracrypt
  ];
}
