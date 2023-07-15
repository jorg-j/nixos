{ config, pkgs, ... }:

let
  # Function to enable the Zsh-autosuggestions plugin
  enableZshAutosuggestions = pkgs.zsh-autosuggestions.overrideAttrs (oldAttrs: {
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.zsh ];
    installPhase = ''
      # Copy the plugin files to the appropriate location
      mkdir -p $out/share/zsh/plugins/zsh-autosuggestions
      cp -r $src/* $out/share/zsh/plugins/zsh-autosuggestions/
    '';
  });
in


{

  # Configure Zsh
  programs.zsh.enable = true;
  # Install the Zsh-autosuggestions plugin
  environment.systemPackages = with pkgs; [ enableZshAutosuggestions ];


  
}
