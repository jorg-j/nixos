{
  lib,
  python3Packages,
}:
with python3Packages;
  buildPythonApplication rec {
    pname = "todoist_load";
    version = "1.0";
    propagatedBuiltInputs = [
      todoist-api-python
      loguru
      requests
    ];
    src = ./.;
    doCheck = false;

    # Change the name to todoist_load
    postInstall = ''
      mv -v $out/bin/todoist_load.py $out/bin/todoist_load
    '';
  }
