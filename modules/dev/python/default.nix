{pkgs, ...}: {
  environment.systemPackages = with pkgs; [

    python311Full # Python 3.11
    python311Packages.pip
    python311Packages.virtualenv
    python311Packages.setuptools
    python311Packages.black
    python311Packages.pytest
    python311Packages.isort
    python3Packages.requests
    pylint
    geany

    poetry
  ]; # Poetry
}
