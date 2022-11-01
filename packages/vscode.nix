{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
        ms-vscode-remote.remote-ssh
        ms-azuretools.vscode-docker
        redhat.vscode-yaml
        vscodevim.vim
    ];
  })
];
}