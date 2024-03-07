{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python37Full # Python 3.7
    python37Packages.setuptools
    python37Packages.pip
    python37Packages.virtualenv
    python37Packages.black
    python37Packages.pytest
    python37Packages.isort
  ]; # Poetry
}
