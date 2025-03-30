with import <nixpkgs> {};
# {
#   lib,
#   python3Packages,
#   pkgs
# }:
with pkgs.python3Packages;
  buildPythonPackage rec {
    # pkgs.stdenv.mkDerivation {
    name = "duckypad";
    version = "1.6.3";
    src = pkgs.fetchzip {
      url = "https://github.com/dekuNukem/duckyPad/releases/download/1.6.3/duckypad_config_1.6.3_source.zip";
      sha256 = "sha256-YM52MBCreXMntakVjpbAddQunD0TNgQPxZslzPqw/7E=";
      stripRoot = false;
    };

    buildInputs = [pkgs.python311Full pkgs.python311Packages.pip pyautogui appdirs hidapi];

    installPhase = ''
      # Create udev dir
      mkdir -p $out/etc/udev/rules.d

      # Add the udev rule
      cat << EOF > $out/etc/udev/rules.d/20-duckyPad.rules
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="d11c", TAG+="uaccess", TAG+="udev-acl"
      EOF

      # create bin
      mkdir -p $out/bin

      # copy src to bin
      cp -r $src/* $out/bin/

      cat << EOF > $out/bin/ducky_base
      #!${pkgs.stdenv.shell}
      ${pkgs.python311Full}/bin/python3 $out/bin/duckypad_config.py
      EOF

      install -m755 -D $out/bin/ducky_base $out/bin/ducky
      # install -m755 -D $src/duckypad_config.py $out/bin/ducky
    '';

    meta = with lib; {
      description = "Configuration software for duckyPad";
      homepage = "https://github.com/dekuNukem/duckyPad";
      license = licenses.mit;
      maintainers = with maintainers; [jorg-j];
    };
  }
