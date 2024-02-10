{ pkgs, ... }:

let
  scriptContent = pkgs.readFile ./commands.sh;
in


{
  environment.systemPackages = [
    pkgs.writeScriptBin
    "command"
    ''
      ${scriptContent}
    ''
  ];


}
