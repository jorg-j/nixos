# Surface is pretty much a brick at the moment
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./surface
    ../profiles/surface.nix
    ../packages/flatpak.nix
    # ../modules/services/todoist
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.device = "/dev/nvme0n1"; # or "nodev" for efi only

  # nix.settings.auto-optimise-store = true;

  networking.hostName = "surface"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # helps with ssd storage
  services.fstrim.enable = true;

  # Set limit on how many generations remain
  # boot.loader.grub.configurationLimit = 5;

  # Enable ZSA Moonlander hardware flashing
  hardware.keyboard.zsa.enable = true;

  # nix.gc.automatic = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
