{ config, pkgs, ... }:

{

  # Enable ZSA Moonlander hardware flashing
  hardware.keyboard.zsa.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "au";
    xkbVariant = "";
  };
}