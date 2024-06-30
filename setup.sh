# used for initial setup of machine

# In Order to run link.sh
# curl -L https://raw.githubusercontent.com/jorg-j/nixos/main/setup.sh > setup.sh

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
sudo nix-env -f '<nixpkgs>' -iA whiptail

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
sudo git clone https://github.com/jorg-j/nixos.git /etc/nixos
check_user_input "repo is cloned"
sudo cp hardware-configuration.nix /etc/nixos/
check_user_input "hardware-config has been copied"

# Update to 23.05
# sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
# sudo nix-channel --update

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nixos-rebuild switch --upgrade

# Directory containing the files
DIRECTORY="/etc/nixos/hosts"

# Generate the file list
FILES=$(ls -1 "$DIRECTORY"/*.nix 2> /dev/null)


# Check if there are any .nix files
if [ -z "$FILES" ]; then
    whiptail --title "No files found" --msgbox "No .nix files found in the directory." 8 45
    exit 1
fi


# Create the options string for Whiptail
OPTIONS=()
for FILE in $FILES; {
    OPTIONS+=("$FILE" "")
}

# Show the Whiptail menu
CHOICE=$(whiptail --title "Choose a file" --menu "Select a file from the list" 15 80 6 "${OPTIONS[@]}" 3>&1 1>&2 2>&3)

# Check if user selected a file
if [ $? -eq 0 ]; then
    echo "You chose: $CHOICE"
else
    echo "No file chosen."
    exit 1
fi

sudo ln --symbolic --directory /etc/nixos/hosts/$CHOICE /etc/nixos/configuration.nix

echo "Go Edit the /etc/nixos/hosts/$CHOICE and link in the hardware-configuration.nix file"
check_user_input "hardware-config is linked"

check_user_input "Ready to build?"
sudo nixos-rebuild switch --keep-going