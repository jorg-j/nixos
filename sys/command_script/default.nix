{pkgs, ...}: let
  scriptContent = builtins.readFile ./commands.sh;

  command = pkgs.writeScriptBin ",command" ''
    #!${pkgs.stdenv.shell}
    ${scriptContent}
  '';

  bannerScriptContent = builtins.readFile ./banner.sh;

  printbanner = pkgs.writeScriptBin "PrintBanner" ''
    #!${pkgs.stdenv.shell}
    ${bannerScriptContent}
  '';

  hyprlandConfigContent = builtins.readFile ./hyprland_setup.sh;

  hyprland_setup = pkgs.writeScriptBin "hyprland_setup" ''
    #!${pkgs.stdenv.shell}
    ${hyprlandConfigContent}




in {
  environment.systemPackages = [
    command
    printbanner
    hyprland_setup
  ];
}
