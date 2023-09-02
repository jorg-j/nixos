

# Build the system
# The below line is specific for arm builds on the desktop
#  --argstr system aarch64-linux
# nix-build -A vm --attr system ./4b.nix --argstr system aarch64-linux



select action in build_only build_vm build_gen_binary gen_binary
do
    echo "Selected: $action"
    break
done

function create_binary() {
    mkdir -p binary_build
    nix copy --to "file://${PWD}/binary_build" ./result
    GZIP_OPT=-9 tar cvzf binary.tar.gz binary_build
}

case $action in
    build_only)
        nix-build --attr system ./4b.nix --argstr system aarch64-linux
    ;;

    build_vm)
        nix-build -A vm --attr system ./4b.nix --argstr system aarch64-linux
    ;;

    build_gen_binary)
        nix-build --attr system ./4b.nix --argstr system aarch64-linux
    ;;

    gen_binary)
        create_binary
    ;;

    *)
        echo "Invalid Selection"
    ;;
esac
