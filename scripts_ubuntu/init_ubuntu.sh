#!/bin/sh

cd ~
# Update and upgrade distro
sudo apt-get update && sudo apt-get dist-upgrade -y

# Install some basic tools
sudo apt-get install git zsh software-properties-common	-y
chsh -s /bin/zsh

# Download dotfiles
git clone https://github.com/Eloo/dotfiles.git
echo "source ~/dotfiles/.dotfile" > .zshrc
chmod u+x ~/dotfiles/helpers/install_awesomefonts.sh
~/dotfiles/helpers/install_awesomefonts.sh

# Let zsh init itself and update
zsh
exit

#
# Add additional PPA's
#

# IntelliJ IDEA
sudo add-apt-repository ppa:mmk2410/intellij-idea-community

# Golang PPA
sudo add-apt-repository ppa:gophers/archive

# Oracle java installer
# sudo add-apt-repository ppa:webupd8team/java

# Install jump 

sudo apt-get update
