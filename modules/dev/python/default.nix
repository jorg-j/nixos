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
    pylint
    geany

    poetry
  ]; # Poetry
}
