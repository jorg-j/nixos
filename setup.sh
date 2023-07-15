# used for initial setup of machine

# In Order to run link.sh
# curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/setup.sh > setup.sh

sudo nix-env --install git

if [ ! -f "/etc/nixos/hardware-configuration.nix" ]; then
  sudo nixos-generate-config
fi

sudo cp /etc/nixos/hardware-configuration.nix .
sudo rm -r /etc/nixos
sudo git clone https://gitlab.com/jorgensen-j/nixos.git /etc/nixos
sudo cp hardware-configuration.nix /etc/nixos/
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz home-manager
sudo nix-channel --update


printf "%s\n" "Select number for system:"
select filetype in RaspberryPi_3B VM Surface
do
    echo "Selected: $filetype"
    break
done

case $filetype in
    RaspberryPi_3B)
        echo "Linking Raspberry Pi"
        sudo ln -sF /etc/nixos/hosts/rpi3.nix /etc/nixos/configuration.nix
    ;;

    VM)
        echo "Linking Virtual Machine"
        sudo ln -sF /etc/nixos/hosts/vm_conf.nix /etc/nixos/configuration.nix
    ;;

    Surface)
        echo "Linking Virtual Machine"
        sudo ln -sF /etc/nixos/hosts/surface.nix /etc/nixos/configuration.nix
    ;;


    *)
        echo "Invalid Selection"
    ;;
esac

sudo nixos-rebuild switch --keep-going