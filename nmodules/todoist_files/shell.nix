with import <nixpkgs> {};
with pkgs.python3Packages;

let
  my-python-packages = ps: with ps; [
  todoist-api-python
  loguru
  requests
  ];

in

pkgs.mkShell {
    name="Python_Dev_Env";
    packages = [
        (pkgs.python3.withPackages my-python-packages)

    ];
    buildInputs = [];
    shellHook = ''
        printf "%s\n" "Setting up environment"

        printf "%s\n" "Environment Setup and Ready"
        echo "tttt" > /home/jack/tt.txt
    '';
}


