{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell rec {
  buildInputs = [
    pkgs.poetry
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.python311Packages.virtualenv
    pkgs.python311Packages.setuptools
    pkgs.python311Packages.black
    pkgs.python311Packages.pytest
    pkgs.python311Packages.isort
    pkgs.python311Packages.numpy
    pkgs.python311Packages.loguru
    pkgs.python311Packages.pip-tools
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

