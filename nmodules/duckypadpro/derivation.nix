# {
#   lib,
#   python3Packages,
#   pkgs,
# }:
with import <nixpkgs> { };
# with pkgs.python3Packages;
  pkgs.python3Packages.buildPythonApplication rec {
    name = "duckypadpro";
    version = "2.1.0";
    src = pkgs.fetchzip {
      url = "https://github.com/dekuNukem/duckyPad-Pro/releases/download/2.1.0/duckypad_config_2.1.0_source.zip";
      sha256 = "sha256-AOd0yLE+hJrLINtt+ZbkBwRFFqzsCGFQdwJNzpVmF60=";
      stripRoot = false;
    };
    format = "other";

    buildInputs = [pkgs.python3Full pkgs.python3Packages.pip pkgs.python3Packages.pyautogui pkgs.python3Packages.appdirs pkgs.python3Packages.hidapi];
    nativeBuildInputs = [pkgs.imagemagick pkgs.libicns];
    propagatedNativeBuildInputs = [pkgs.python3Full pkgs.python3Packages.pip python3Packages.pyautogui python3Packages.appdirs python3Packages.hidapi];

    propagatedBuildInputs = [
      (pkgs.python3.withPackages (pythonPackages:
        with pythonPackages; [
          pyautogui
          appdirs
          hidapi
          platformdirs
          psutil
        ]))
    ];

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

      sed -i '1 i\#!/usr/bin/env python3' $out/bin/duckypad_config.py
      sed -i 's|DUCKYPAD_UI_SCALE", default=1))|DUCKYPAD_UI_SCALE", default=2))|' $out/bin/duckypad_config.py

      install -m755 -D $out/bin/duckypad_config.py $out/bin/duckypad

      # Create .desktop file
      mkdir -p $out/share/applications
      mkdir -p $out/share/icons

      #icns2png -x $out/bin/icon.icns
      #mv icon_1024x1024x32.png $out/share/icons/ducky_icon.png

      cat << EOF > $out/share/applications/duckypadpro.desktop
      [Desktop Entry]
      Encoding=UTF-8
      Name=duckypadpro
      Comment=GUI for Duckypad keypad
      Exec=$out/bin/duckypad %U
      Type=Application
      Categories=Utility;
      MimeType=application/duckypadpro;
      EOF

      chmod 755 $out/share/applications/duckypadpro.desktop
    '';

    postInstall = ''

    '';

    meta = with lib; {
      description = "Configuration software for duckyPad pro";
      homepage = "https://github.com/dekuNukem/duckyPad";
      license = licenses.mit;
      maintainers = with maintainers; [];
    };
  }
