# used for initial setup of machine

# In Order to run link.sh
# curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/setup.sh > setup.sh

sudo nix-env -f '<nixpkgs>' -iA git

if [ ! -f "/etc/nixos/hardware-configuration.nix" ]; then
  sudo nixos-generate-config
fi

check_user_input(){
    echo "Verify before continuing"
    echo "$1"
    read -p "y/n " input
    case $input in
         [Yy]*) echo "Continuing";;
         [Nn]*) exit;;
             *) check_user_input;;
    esac
}

sudo cp /etc/nixos/hardware-configuration.nix .
check_user_input "hardware-config has been copied"
sudo rm -r /etc/nixos
sudo git clone https://gitlab.com/jorgensen-j/nixos.git /etc/nixos
check_user_input "repo is cloned"
sudo cp hardware-configuration.nix /etc/nixos/
check_user_input "hardware-config has been copied"
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
sudo nix-channel --update


printf "%s\n" "Select number for system:"
select filetype in RaspberryPi_3B VM Surface Desktop
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

    Surface)
        echo "Linking Desktop"
        sudo ln -sF /etc/nixos/hosts/desktop.nix /etc/nixos/configuration.nix
        echo "Go Edit the /etc/nixos/hosts/desktop.nix and link in the hardware-configuration.nix file"
        check_user_input "hardware-config is linked"
    ;;


    *)
        echo "Invalid Selection"
    ;;
esac
check_user_input "Ready to build?"
sudo nixos-rebuild switch --keep-going