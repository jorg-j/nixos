{
  pkgs,
  config,
  lib,
  ...
}: {
  fonts = {
    fontconfig = {
      enable = lib.mkForce true;

      # System-wide default fonts
      defaultFonts = {
        monospace = ["JetBrains Mono" "12"];
        sansSerif = ["JetBrains Mono"];
        serif = ["JetBrains Mono"];
      };
    };

    # Enable a basic set of fonts providing font styles and
    # families and reasonable coverage of Unicode
    enableDefaultPackages = true;

    # Create a directory with links to all fonts in
    # /run/current-system/sw/share/X11/fonts
    fontDir.enable = true;

    # List of primary font paths
    packages = with pkgs; [
      ibm-plex
      jetbrains-mono
      hasklig
      hack-font
      #nerdfonts

      material-design-icons
      material-icons

      powerline-fonts
      emacs-all-the-icons-fonts

      fira
      fira-mono
      fira-code
      fira-code-symbols

      noto-fonts
      noto-fonts-emoji

      roboto
      roboto-mono
      roboto-slab

      anonymousPro
      corefonts
      source-code-pro
    ];
  };
}
