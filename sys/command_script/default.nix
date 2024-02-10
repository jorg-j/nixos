{ pkgs, ... }:

let
  scriptContent = builtins.readFile ./commands.sh;
  command = pkgs.writeScriptBin
    "command"
    ''
      ${scriptContent}
    '';
in


{
  environment.systemPackages = [
    command
  ];

}
