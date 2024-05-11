{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./aliases.nix
    ./insecure_packages.nix
    ./scripts.nix
    ./time_local.nix
    ./keymap.nix
    ./sound.nix
  ];
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Disable Sudo password on wheel users
  security.sudo.wheelNeedsPassword = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes and nix-command
  nix.settings.experimental-features = ["flakes" "nix-command"];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set Trusted Users
  nix.settings.trusted-users = ["jack" "root" "@wheel"];

  systemd.user.extraConfig = ''
    DefaultEnvironment="PATH=/run/current-system/sw/bin"
  '';

  environment = {
    systemPackages = with pkgs; [
      cryfs
      gocryptfs
      just
      libnotify
      ntfs3g
      exfat
      gvfs
      polkit_gnome
      nixpkgs-fmt
      sshpass
      xbindkeys
      newt
      dialog
      qalculate-gtk
    ];
  };

  options.our.roles.nuc.enable = lib.mkEnableOption "nuc";
  options.our.roles.hpserver.enable = lib.mkEnableOption "hpserver";
}
