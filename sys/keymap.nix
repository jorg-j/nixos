{
  config,
  pkgs,
  ...
}: {
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "au";
    xkb.variant = "";
  };
}
