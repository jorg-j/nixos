with import <nixpkgs> {};
# {
#   lib,
#   python3Packages,
#   pkgs
# }:
with pkgs.python3Packages; let
  myPkgs = pkgs.python311.withPackages (ps:
    with ps; [
      pyautogui
      hidapi
      appdirs
    ]);
in
  buildPythonPackage rec {
    name = "duckypad";
    version = "1.6.3";
    src = pkgs.fetchzip {
      url = "https://github.com/dekuNukem/duckyPad/releases/download/1.6.3/duckypad_config_1.6.3_source.zip";
      sha256 = "sha256-YM52MBCreXMntakVjpbAddQunD0TNgQPxZslzPqw/7E=";
      stripRoot = false;
    };
    doCheck = false;

    DUCKYPAD_UI_SCALE = 2;
    builtInputs = [pkgs.python311Full pkgs.python311Packages.pip]; # python3Packages.pyautogui python3Packages.appdirs python3Packages.hidapi];
    propagatedBuiltInputs = [pkgs.python311Full pkgs.python311Packages.pip]; # python3Packages.pyautogui python3Packages.appdirs python3Packages.hidapi];
    propagatedNativeBuildInputs = [pkgs.python311Full pkgs.python311Packages.pip python3Packages.pyautogui python3Packages.appdirs python3Packages.hidapi];

    preBuild = ''

        mkdir -p duckypad
        mv *.py duckypad/
        rm duckypad/setup.py

        # sed -i -e "1i #!${pkgs.python311Full}/bin/python3" duckypad/duckypad_config.py

        # sed -i 's/root.mainloop()/if __name__=="__main__":\n    root.mainloop()/g' duckypad/duckypad_config.py


        cat > setup.py << EOF
      from setuptools import setup

      install_requires = ['pyautogui', 'appdirs', 'hidapi']

      setup(
        name='duckypad',
        #packages=['someprogram'],
        version='1.6.3',
        #author='...',
        #description='...',
        install_requires=install_requires,
        # entry_points={
        #   'console_scripts': ["duckypad.duckypad_config:__main__"],
        # }
        # scripts=[
        #     'duckypad/duckypad_config.py'
        #   ],

        # py_modules=[
        #   'check_update.py',
        #   'ds_syntax_check.py',
        #   'ds3_preprocessor.py',
        #   'duck_objs.py',
        #   'hid_op.py',
        #   'keywords.py',
        #   'make_bytecode.py',
        #   'my_comp.py',
        #   'myast.py'
        # ]
      )
      EOF


        # Create udev dir
        mkdir -p $out/etc/udev/rules.d

        # Add the udev rule
        cat << EOF > $out/etc/udev/rules.d/20-duckyPad.rules
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="d11c", TAG+="uaccess", TAG+="udev-acl"
      EOF

    '';

    preInstall = ''

      python setup.py install --prefix=$out
      # rm $out/bin/duckypad_config.py
    '';

    postInstall = ''
          mkdir $out/bin/

          # mv src/* $out/bin/

          # mv -v $out/bin/duckypad_config.py $out/bin/duckypad

      cat > $out/bin/run.py << EOF
      #!${pkgs.python311Full}/bin/python3
      import duckypad

      EOF
          install -m755 -D $out/bin/run.py $out/bin/duckypad
          # install -m755 -D $out/bin/duckypad_config.py $out/bin/duckypad
    '';

    meta = with lib; {
      description = "Configuration software for duckyPad";
      homepage = "https://github.com/dekuNukem/duckyPad";
      license = licenses.mit;
      maintainers = with maintainers; [];
    };
  }
