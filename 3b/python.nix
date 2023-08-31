{ pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      python37Full # Python 3.9
      python37Packages.pip
      python37Packages.virtualenv
      python37Packages.black
      python37Packages.pytest
      python37Packages.isort
    ]; # Poetry
}
