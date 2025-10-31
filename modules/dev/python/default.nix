{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python312Full # Python 3.11
    python312Packages.pip
    python312Packages.virtualenv
    python312Packages.setuptools
    python312Packages.black
    python312Packages.pytest
    python312Packages.isort
    python312Packages.requests
    python312Packages.uv
    python312Packages.opencv4
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
