{ lib, python3Packages }:

with python3Packages;
buildPythonApplication {
    pname = "test1";
    version = "1.0";
    propagatedBuiltInputs = [ ];
    src = ./.;
    doCheck = false;
}