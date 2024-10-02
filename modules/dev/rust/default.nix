{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    rustc
    cargo
    rustfmt
    gcc
    pkg-config


  ];



}
