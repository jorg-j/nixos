# NixOS

# Initial Install

After install run.

`sudo nano /etc/nixos/configuration.nix`

add git to the packages list

exit.

`sudo nixos-rebuild switch --keep-going`


OR

`sudo nixos-env --install git`
`sudo nixos-rebuild switch --keep-going`
#

To run manually
```
git clone https://gitlab.com/jorgensen-j/nixos.git /etc/nixos
ln -sF /etc/nixos/hosts/<config>.nix /etc/nixos/configuration.nix
```

OR

`curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/link.sh | tee link.sh`

# If you've not installed yet
`nixos-install`

# If you've already installed, but are switching to this config
`nixos-rebuild switch --keep-going`

# RPi 3B

Flash the image to sd card

https://hydra.nixos.org/build/127900853


Note: check where the /dev is on the sd card is first so you don't install it over the top of an actual filesystem. `dmesg --follow`

`sudo dd if=nixos-sd-image-19.09.2522.75f4ba05c63-aarch64-linux.img of=/dev/sdb bs=4M conv=fsync status=progress`


Insert into RPi3

Boot with a monitor

Run the below to create a supplicant file for the wifi

`wpa_passphrase $SSID $PASS | tee wpa_supplicant.conf`

Run this to standup the wifi
`sudo wpa_supplicant -B -i wlan0 wpa_supplicant.conf &`



Copy the Config

`curl -L https://gitlab.com/jorgensen-j/nixos/-/raw/main/link.sh | tee link.sh`

`bash link.sh`

rebuild

`sudo nixos-rebuild switch`

Cleanup

`sudo nix-collect-garbage -d`
  

To Enable HDMIless boot

  
Open the FIRMWARE partition config.txt

add the below to FIRMWARE/config.txt

```

hdmi_force_hotplug=1

hdmi_drive=2

```


## XFCE

If using XFCE after build run the `xfce_config` command to update the theme