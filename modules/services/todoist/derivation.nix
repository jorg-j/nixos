{ lib, pkgs, python3Packages }:

with python3Packages;
buildPythonApplication rec {
    pname = "todoist_load";
    version = "1.0";
    propagatedBuiltInputs = [ 
        pkgs.python3Packages.todoist-api-python
        pkgs.python3Packages.loguru
        pkgs.python3Packages.requests
    ];
    src = ./.;
    doCheck = false;

    # Change the name to todoist_load 
    postInstall = ''
    mv -v $out/bin/todoist_load.py $out/bin/todoist_load
    '';
    
}