{
  lib,
  python3Packages,
  pkgs
}:
with pkgs.python3Packages;


buildPythonApplication rec {
  name = "duckypad";
  version = "1.6.3";
  src = pkgs.fetchzip {
    url = "https://github.com/dekuNukem/duckyPad/releases/download/1.6.3/duckypad_config_1.6.3_source.zip";
    sha256 = "sha256-YM52MBCreXMntakVjpbAddQunD0TNgQPxZslzPqw/7E=";
    stripRoot=false;
  };
  format = "other";

  buildInputs = [ pkgs.python311Full pkgs.python311Packages.pip pyautogui appdirs hidapi];
  nativeBuildInputs = [ pkgs.imagemagick ];
  propagatedNativeBuildInputs = [ pkgs.python311Full pkgs.python311Packages.pip python3Packages.pyautogui python3Packages.appdirs python3Packages.hidapi];

  propagatedBuildInputs = [
    (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
      pyautogui
      appdirs
      hidapi
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
    sed -i 's/ENV_UI_SCALE else 1/ENV_UI_SCALE else 2/' $out/bin/duckypad_config.py
    
    install -m755 -D $out/bin/duckypad_config.py $out/bin/duckypad
  '';

  postInstall = ''
    for i in 16 24 48 64 96 128 256 512; do
      mkdir -p $out/share/icons/hicolor/''${i}x''${i}/apps
      convert -background none -resize ''${i}x''${i} $src/icon.icns $out/share/icons/hicolor/''${i}x''${i}/apps/${name}.png
    done



    cat << EOF > $out/share/applications/duckypad.desktop
    [Desktop Entry]
    Encoding=UTF-8
    Name=duckypad
    Comment=GUI for Duckypad keypad
    Exec=$out/bin/duckypad %U
    Type=Application
    Icon=$out/bin/icon.icns
    Categories=Utilities; 
    MimeType=application/duckypad;
    EOF
  '';

  meta = with lib; {
    description = "Configuration software for duckyPad";
    homepage = "https://github.com/dekuNukem/duckyPad";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}

