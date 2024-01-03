{ lib, pkgs, stdenv, ... }:

# { config, lib, pkgs, ... }:
let
  pname = "freearc";
  version = "50";
  appname = "freearc";
  meta = with lib; {
    description = "";
    homepage = "";
    downloadPage = "";
    # license = licenses.obsidian;
    maintainers = with maintainers; [ ];
  };

  filename = "FreeArc-0.50-linux-i386-alpha-2008-06-22.tar.bz2";
  src = pkgs.fetchurl {
    url = "https://github.com/jorg-j/nixos/blob/main/modules/apps/tools/FreeArc-0.50-linux-i386-alpha-2008-06-22.tar.bz2";
    sha256 = "sha256-3nOwjZXa3AtuCpwiILCQ/SCduuxSlIg03dya1Y82+ro=";
  };


  arc = pkgs.stdenv.mkDerivation {
    name = pname;
    version = version;
    src = src;
    nativeBuildInputs = [ pkgs.clang pkgs.bzip2 ];
    unpackPhase = "bzip2 -d $src";
    buildPhase = ''
      cd FreeArc-0.50-linux-i386-alpha-2008-06-22
      make
    '';
    installPhase = ''
      mkdir -p $out/bin
      ls
      cp cmix $out/bin

    '';
  };

in
{
  environment.systemPackages = [ arc ];

}
