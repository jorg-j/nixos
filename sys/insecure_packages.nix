{
  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.6" # For nixops to work
    "python2.7-certifi-2021.10.8" # For nixops to work
    "python2.7-pyjwt-1.7.1" # For nixops to work
    "openssl-1.1.1u" # For nixops to work
    "electron-21.4.0"
    "electron-24.8.6"
    "nvidia-x11-535.86.05-6.1.58" # For lib6 to work
    "freeimage-unstable-2021-11-01"
    "archiver-3.5.1"
  ];
}
