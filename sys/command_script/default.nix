{ pkgs, ... }:

let
  scriptContent = pkgs.readFile ./commands.sh;
in

pkgs.writeScriptBin "command" ''
  ${scriptContent}
''
