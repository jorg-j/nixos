{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfgNuc = config.our.roles.nuc;
  cfgHP = config.our.roles.hpserver;
in {
  config = {
    environment.systemPackages = with pkgs;
      if cfgNuc.enable
      then [
        (
          vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions;
              [
                dracula-theme.theme-dracula
                jdinhlife.gruvbox
                ms-vscode-remote.remote-ssh
                ms-azuretools.vscode-docker
                redhat.vscode-yaml
                # eamodio.gitlens
                ms-toolsai.jupyter
                esbenp.prettier-vscode
                ms-python.python
                ms-python.vscode-pylance
                davidanson.vscode-markdownlint
                bbenoist.nix
              ]
              ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                {
                  name = "document";
                  publisher = "mintlify";
                  version = "2.2.1";
                  sha256 = "2kV8shVxd56nvdORwPqoZ881IR8wQ19iHkNI9FUkoj8=";
                }
                # {
                #   name = "zopeneditor"; # COBOL
                #   publisher = "IBM";
                #   version = "3.3.3";
                #   sha256 = "6mvo2i/JzLHdUTlvfj2JOIj312Ux7SY+XQ/4lAdwrQI=";
                # }
                # {
                #   name = "vscode-extension-for-zowe"; # COBOL
                #   publisher = "Zowe";
                #   version = "2.13.0";
                #   sha256 = "/EntCDFiSIuEQfTMdPGCs6eFlmvxv+aVw+RBDl2as+c=";
                # }
              ];
          }
        )
      ]
      else if cfgHP.enable
      then []
      else [];
  };
}
