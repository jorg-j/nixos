# used for initial setup of machine

# In Order to run link.sh
# curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/setup.sh > setup.sh

# Have the user confirm certain items before continuing
# Helps to prevent stupid
check_user_input(){
    echo "Verify before continuing"
    echo "$1"
    read --prompt "y/n " input
    case $input in
         [Yy]*) echo "Continuing";;
         [Nn]*) exit;;
             *) check_user_input;;
    esac
}


# Install git minimal
sudo nix-env -f '<nixpkgs>' -iA git

# If there is no hardware-configuration then generate one
if [ ! -f "/etc/nixos/hardware-configuration.nix" ]; then
  sudo nixos-generate-config
fi

# Copy the nixos/hardware-configuration.nix file to the current dir
# Then confirm with the user this has occured before removing /etc/nixos
sudo cp /etc/nixos/hardware-configuration.nix .
check_user_input "hardware-config has been copied"
sudo rm --recursive /etc/nixos

# Clone the git repo, confirm with the user this has occured
# Then move the hardware-configuration.nix file back to /etc/nixos
sudo git clone https://gitlab.com/jorgensen-j/nixos.git /etc/nixos
check_user_input "repo is cloned"
sudo cp hardware-configuration.nix /etc/nixos/
check_user_input "hardware-config has been copied"

# Update to 23.05
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
sudo nix-channel --update


printf "%s\n" "Select number for system:"
select filetype in VM Surface Desktop
do
    echo "Selected: $filetype"
    break
done

case $filetype in

    VM)
        echo "Linking Virtual Machine"
        sudo ln --symbolic --directory /etc/nixos/hosts/vm_conf.nix /etc/nixos/configuration.nix
    ;;

    Surface)
        echo "Linking Virtual Machine"
        sudo ln --symbolic --directory /etc/nixos/hosts/surface.nix /etc/nixos/configuration.nix
    ;;

    Desktop)
        echo "Linking Desktop"
        sudo ln --symbolic --directory /etc/nixos/hosts/desktop.nix /etc/nixos/configuration.nix
        echo "Go Edit the /etc/nixos/hosts/desktop.nix and link in the hardware-configuration.nix file"
        check_user_input "hardware-config is linked"
    ;;


    *)
        echo "Invalid Selection"
    ;;
esac
check_user_input "Ready to build?"
sudo nixos-rebuild switch --keep-going