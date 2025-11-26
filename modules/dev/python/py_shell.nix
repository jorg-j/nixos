{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell rec {
  buildInputs = [
    pkgs.poetry
    pkgs.python3
    pkgs.python3Packages.pip
    pkgs.python3Packages.virtualenv
    pkgs.python3Packages.setuptools
    pkgs.python3Packages.black
    pkgs.python3Packages.pytest
    pkgs.python3Packages.isort
    pkgs.python3Packages.numpy
    pkgs.python3Packages.loguru
    pkgs.python3Packages.pip-tools
    pkgs.cmake
  ];

  # Prevent numpy from shitting itself
  LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib"
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib.outPath}/lib:$LD_LIBRARY_PATH"

  '';
}
