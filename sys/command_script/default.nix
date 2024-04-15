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
in {
  environment.systemPackages = [
    command
    printbanner
  ];
}
