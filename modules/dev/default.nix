{ pkgs, ... }:

{
    imports = [
    ./python
  ];


permittedInsecurePackages = [
  "python-2.7.18.6"
];

environment.systemPackages = with pkgs;
  [
    gnumake
    nixos-generators
    nixops
  ];
}
