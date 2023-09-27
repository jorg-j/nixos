{ nixpkgs ? import <nixpkgs> { } }:

nixpkgs.mkShell {
  nativeBuildInputs = with nixpkgs; [
    pkgs.poetry
    pkgs.python310
    pkgs.python310Packages.pip
    pkgs.python310Packages.virtualenv
    pkgs.python310Packages.setuptools
    pkgs.python310Packages.black
    pkgs.python310Packages.pytest
    pkgs.python310Packages.isort
    pylint
    mypy
  ];


  # Prevent numpy from shitting itself
  LD_LIBRARY_PATH = "${nixpkgs.stdenv.cc.cc.lib}/lib";

  shellHook = ''
    poetry install

  '';
}
