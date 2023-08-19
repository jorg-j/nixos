{ lib, pkgs, python3Packages }:

with python3Packages;
buildPythonApplication {
  pname = "todoist_load";
  version = "1.0";
  propagatedBuildInputs = [
    loguru
    requests
    todoist-api-python
  ];
  src = ./.;
  doCheck = true;

  # Change the name to todoist_load 
  postInstall = ''
    mv -v $out/bin/todoist_load.py $out/bin/todoist_load
  '';

}
