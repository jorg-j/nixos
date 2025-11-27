{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python3 # Python 3.11
    python3Packages.pip
    python3Packages.virtualenv
    python3Packages.setuptools
    python3Packages.black
    python3Packages.pytest
    python3Packages.isort
    python3Packages.requests
    python3Packages.uv
    python3Packages.opencv4
    pylint
    geany

    poetry

    # Qt5 and dependencies
    qt5.qtbase
    qt5.qttools

    # OpenGL libraries
    libGL
    libglvnd
    mesa
    
    # GLib and related libraries
    glib
    glibc


  ]; 
}
