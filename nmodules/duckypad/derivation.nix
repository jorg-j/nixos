# with import <nixpkgs> { };
{
  lib,
  python3Packages,
  pkgs
}:
with pkgs.python3Packages;

# buildPythonPackage rec {
pkgs.stdenv.mkDerivation {
  name = "duckypad";
  version = "1.6.3";
  src = pkgs.fetchzip {
    url = "https://github.com/dekuNukem/duckyPad/releases/download/1.6.3/duckypad_config_1.6.3_source.zip";
    sha256 = "sha256-YM52MBCreXMntakVjpbAddQunD0TNgQPxZslzPqw/7E=";
    stripRoot=false;
  };

  nativeBuildInputs = [ pkgs.bzip2 ];
  buildInputs = [ pkgs.python311Full pkgs.python311Packages.pip pyautogui appdirs hidapi];

#   unpackPhase = "bzip2 -d $src";


  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/* $out/bin/
    install -m755 -D $src/duckypad_config.py $out/bin/ducky
  '';

#   postUnpack = ''
#   ls $src
#   chmod +w $src/setup.py
#   substituteInPlace $src/setup.py --replace "options={'py2app': OPTIONS}," ""

# #   sed -i "s/options={'py2app': OPTIONS},//g" $src/setup.py
# #   cat $src/setup.py
#   '';

#   installPhase = ''
#     mkdir -p $out/bin
#     cp -r $src/* $out/bin/

#     # Create a wrapper script
#     cat > $out/bin/ducky <<EOF
#     #!${pkgs.stdenv.shell}
#     sudo exec ${python3Packages.python}/bin/python $out/bin/duckypad_config.py "\$@"
#     EOF
#   '';

  meta = with lib; {
    description = "Configuration software for duckyPad";
    homepage = "https://github.com/dekuNukem/duckyPad";
    license = licenses.mit;
    maintainers = with maintainers; [ jorg-j ];
  };
}

