#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Omarchy installation failed! You can retry by running: source ~/.local/share/omarchy/install.sh"' ERR

source /etc/os-release
if [[ "$ID" == "artix" ]]
then
  ARTIX=true
  export ARTIX
fi
# Install everything
for f in ~/.local/share/omarchy/install/*.sh; do source "$f"; done

# Ensure locate is up to date now that everything has been installed
sudo updatedb

gum confirm "Reboot to apply all settings?" && reboot
