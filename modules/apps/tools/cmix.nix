{ config
, lib
, pkgs
, ...
}:
with lib; let
  hpserver = config.our.roles.hpserver;
  pname = "cmix";
  version = "20";
  appname = "cmix";
  meta = with lib; {
    description = "cmix is a lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage.";
    homepage = "http://www.byronknoll.com/cmix.html";
    downloadPage = "http://www.byronknoll.com/cmix.html";
    # license = licenses.obsidian;
    maintainers = with maintainers; [ ];
  };

  filename = "cmix-v${version}.zip";
  src = pkgs.fetchurl {
    url = "http://www.byronknoll.com/cmix-v${version}.zip";
    sha256 = "sha256-x/8aPku0bRa0cIoLLEqGn3TOggTe49IN1tMTtsItpD4=";
  };

  cmix = pkgs.stdenv.mkDerivation {
    name = pname;
    version = version;
    src = src;
    nativeBuildInputs = [ pkgs.clang pkgs.unzip ];
    unpackPhase = "unzip $src";
    buildPhase = ''
      cd cmix
      make
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp cmix $out/bin

    '';
  };
in
{


  # Both of the below work
  config = {
    environment.systemPackages = mkIf hpserver.enable [ cmix ];
  };

  # config = {
  #   environment.systemPackages =
  #     if hpserver.enable
  #     then [ cmix ]
  #     else [ ];
  # };

}
