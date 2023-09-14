{ pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      python39Full # Python 3.9
      python39Packages.pip
      python39Packages.virtualenv
      python39Packages.setuptools
      python39Packages.black
      python39Packages.pytest
      python39Packages.isort
      pylint


      poetry
    ]; # Poetry

  pkgs.mkShell {
  LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
}
}
