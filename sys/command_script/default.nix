{ pkgs, ... }:

let
  scriptContent = builtins.readFile ./commands.sh;
in


{

  command = pkgs.writeScriptBin
    "command"
    ''
      ${scriptContent}
    '';

  environment.systemPackages = [
    command
  ];

}
