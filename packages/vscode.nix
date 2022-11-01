{ config, lib, pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    users.jack = {
      programs.vscode.enable = true;

      programs.vscode.package = vscode;

      programs.vscode.userSettings = {
        "editor.tabSize" = 4;
        "editor.lineNumbers" = "relative";
        "[php]"."editor.tabSize" = 4;
        "workbench.colorTheme" = "GitHub Dark";
      };

      programs.vscode.extensions = with pkgs.vscode-extensions; [
        ms-vscode-remote.remote-ssh
        ms-azuretools.vscode-docker
        redhat.vscode-yaml
        vscodevim.vim
      ];
    };
  };
}