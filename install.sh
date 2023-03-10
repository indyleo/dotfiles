#!/bin/sh

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
apt update;
apt upgrade -y;

# Install nala
apt install nala -y;

# Installing CLI programs
nala install gh tree xsel tty-clock libhidapi-dev yarn webpack gpg openssl tldr htop trash-cli neofetch neovim vim lolcat cmatrix cmake g++ wget python3 xdotool unzip python3-setuptools ripgrep fd-find luarocks golang-go shellcheck python3-venv git build-essential -y;

# Installing other pkg managers
nala install python3-pip npm -y;

# Installing zsh
nala install zsh zsh-syntax-highlighting -y;

# Installing java 
nala install openjdk-8-jdk openjdk-8-jre openjdk-17-jdk openjdk-17-jre -y;

# Installing GUI programs 
nala install timeshift alacritty mesa-utils transmission-gtk dconf-editor gnome-tweaks solaar virt-manager steam:i386 gnome-extensions-app -y;

# Installing a music player
nala install rhythmbox rhythmbox-plugins -y;

# Installing media stuff
nala install peek obs-studio kdenlive audacity -y;

# Installing firefox
nala purge firefox-esr -y;
nala install firefox -y;

# Script Variables
username=$(id -u -n 1000)

# Installing fonts 
nala install fonts-font-awesome -y;
mkdir -p /home/$username/.fonts;
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip;
unzip FiraCode.zip -d /home/$username/.fonts;
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip;
unzip Meslo.zip -d /home/$username/.fonts;
chown $username:$username /home/$username/.fonts/;
chown $username:$username /home/$username/.fonts/*;

# Reloading cache
fc-cache -vf;
# Removing zip files
rm ./FiraCode.zip ./Meslo.zip;

# Setting up ufw 
nala install ufw -y;
sudo ufw limit 22/tcp;
sudo ufw allow 80/tcp;
sudo ufw allow 443/tcp;
sudo ufw default deny incoming;
sudo ufw default allow outgoing;
sudo ufw enable;

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh;
