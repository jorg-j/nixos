{ pkgs, ... }:

{
    imports = [
    ./python
  ];

environment.systemPackages = with pkgs;
  [
    gnumake
  ];
}
