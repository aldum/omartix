#!/bin/bash

if [[ "$ARTIX" == "true" ]]
then
  # TODO
  return
fi
# Install bluetooth controls
yay -S --noconfirm --needed blueberry

# Turn on bluetooth by default
sudo systemctl enable bluetoothd
