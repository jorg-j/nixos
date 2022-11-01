{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
        ms-vscode-remote.remote-ssh
        ms-azuretools.vscode-docker
        redhat.vscode-yaml
        vscodevim.vim
        shakram02.bash-beautify
        ms-vscode-remote.remote-containers
        eamodio.gitlens
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        bierner.markdown-mermaid
        gera2ld.markmap-vscode
        mintlify.document
        esbenp.prettier-vscode
        ms-python.python
        ms-vscode-remote.remote-ssh
        johnnywong.vscode-ts-whitespace-converter
    ];
  })
];
}