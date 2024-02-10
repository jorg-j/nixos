{ pkgs, ... }:

let
  scriptContent = builtins.readFile ./commands.sh;
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
