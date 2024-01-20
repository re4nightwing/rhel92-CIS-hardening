#!/bin/bash

generate_grub_password() {
    echo "Enter the desired GRUB2 password:"
    read -s GRUB_PASSWORD
    hashed_password=$(sudo grub2-mkpasswd-pbkdf2 <<< "$GRUB_PASSWORD")
    echo "Generated hashed password: $hashed_password"
    echo "$hashed_password"  # Return the hashed password
}

update_grub_config() {
    echo "Setting GRUB2 password..."
    echo "GRUB2_PASSWORD=$1" | sudo tee -a /etc/default/grub
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
    echo "GRUB2 password set successfully."
}

hashed_password=$(generate_grub_password)

if [[ -n "$hashed_password" ]]; then
    update_grub_config "$hashed_password"
    
    echo "Rebooting the system to apply changes..."
    sudo reboot
else
    echo "Error: Unable to generate GRUB2 password."
fi