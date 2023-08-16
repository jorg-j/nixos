{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; 
  [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; 
      [
          ms-vscode-remote.remote-ssh
          ms-azuretools.vscode-docker
          redhat.vscode-yaml
          eamodio.gitlens
          ms-toolsai.jupyter
          esbenp.prettier-vscode
          ms-python.python
          davidanson.vscode-markdownlint
          bbenoist.Nix
      ]++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "document";
        publisher = "mintlify";
        version = "2.2.1";
        sha256 = "2kV8shVxd56nvdORwPqoZ881IR8wQ19iHkNI9FUkoj8=";
      }];
     }
    )
  ];
}