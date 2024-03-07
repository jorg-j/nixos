{
  config,
  pkgs,
  ...
}: let
  fpak = pkgs.writeScriptBin "fpak" ''
    #!${pkgs.stdenv.shell}
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak update -y
    flatpak install vaults -y
    flatpak install flathub com.valvesoftware.Steam -y
    flatpak install flathub org.telegram.desktop -y
    flatpak install com.github.tenderowl.frog -y
    flatpak install md.obsidian.Obsidian -y
  '';
in {
  # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Add fpak command to the system
  environment.systemPackages = [
    fpak
  ];
}
