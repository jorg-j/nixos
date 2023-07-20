

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
        sudo nix-channel --add https://nixos.org/channels/nixos-22.05 nixos
        sudo nix-channel --update
<<<<<<< HEAD

=======
        printf "%s\n" "Go get a coffee or watch TV, rebuild is going to take a while. Seriously"
        select choice in rebuild norebuild
        do
            echo "$choice"
            break
        done
        case $choice in)
            rebuild)
                printf "%s\nCOFFEEEEE TIME"
                sudo nixos-rebuild switch --upgrade
                ;;
            norebuild)
                printf "%s\nRun this when you are ready: sudo nixos-rebuild switch --upgrade"
                ;;
            *)
                printf "%s\n" "Invalid selection"
                ;;
        esac
>>>>>>> 6f865fb (update)
    ;;

    VM)
        echo "Linking Virtual Machine"
        sudo ln -sF /etc/nixos/hosts/vm_conf.nix /etc/nixos/configuration.nix
    ;;

    *)
        echo "Invalid Selection"
    ;;
esac