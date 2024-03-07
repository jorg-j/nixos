{pkgs, ...}: let
  scriptContent = builtins.readFile ./commands.sh;
  command = pkgs.writeScriptBin ",command" ''
    #!${pkgs.stdenv.shell}
    ${scriptContent}
  '';
in {
  environment.systemPackages = [
    command
  ];
}
