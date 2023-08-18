

# In Order to run link.sh
# curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/link.sh | tee link.sh

printf "%s\n" "Select number for system:"

select filetype in RaspberryPi_3B VM
do
    echo "Selected: $filetype"
    break
done

sudo nix-env -f '<nixpkgs>' -iA git
sudo git clone https://gitlab.com/jorgensen-j/nixos.git /etc/nixos


case $filetype in
    RaspberryPi_3B)
        echo "Linking Raspberry Pi"
        sudo rm -r /etc/nixos
        sudo ln -sF /etc/nixos/hosts/rpi3.nix /etc/nixos/configuration.nix
        # sudo nix-channel --add https://nixos.org/channels/nixos-22.05 nixos
        # sudo nix-channel --update
    ;;

    VM)
        echo "Linking Virtual Machine"
        sudo ln -sF /etc/nixos/hosts/vm_conf.nix /etc/nixos/configuration.nix
    ;;

    *)
        echo "Invalid Selection"
    ;;
esac