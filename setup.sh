# used for initial setup of machine

# In Order to run link.sh
# curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/setup.sh | tee setup.sh


if [ ! -f "/etc/nixos/hardware-configuration.nix" ]; then
  nixos-generate-config
fi

sudo cp /etc/nixos/hardware-configuration.nix /home/"$USER"/hardware-configuration.nix
sudo rm -r /etc/nixos
sudo git clone https://gitlab.com/jorgensen-j/nixos.git /etc/nixos


printf "%s\n" "Select number for system:"
select filetype in RaspberryPi_3B VM
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

    *)
        echo "Invalid Selection"
    ;;
esac