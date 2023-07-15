{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vorta
  ];
}
