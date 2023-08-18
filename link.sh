# In Order to run link.sh
# curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/link.sh | tee link.sh

# Asks the user for which system they want to install
# Removes the /etc/nixos directory and replaces git repo
# Creates the symbolic link for the hostfile

printf "%s\n" "Select number for system:"

select filetype in RaspberryPi_3B VM
do
    echo "Selected: $filetype"
    break
done

sudo nix-env \
    --file '<nixpkgs>' \
    -iA git

clone_link() {
    sudo git clone https://gitlab.com/jorgensen-j/nixos.git /etc/nixos
    printf "%s\n" "Linking $1 to configuration.nix"
    sudo ln --symbolic --directory /etc/nixos/hosts/$1.nix /etc/nixos/configuration.nix
}


case $filetype in
    RaspberryPi_3B)
        echo "Linking Raspberry Pi"
        sudo rm --recursive /etc/nixos
        clone_link rpi3
    ;;

    VM)
        echo "Linking Virtual Machine"
        clone_link vm_conf
    ;;

    *)
        echo "Invalid Selection"
    ;;
esac

printf "%s\n" "Complete"
printf "%s\n" "Run 'sudo nixos-rebuild switch' to rebuild the system"