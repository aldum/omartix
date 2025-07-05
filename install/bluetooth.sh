#!/bin/bash

# Install bluetooth controls
yay -S --noconfirm --needed blueberry

[[ "$ARTIX" == "true" ]] && {
    yay -S --noconfirm --needed bluez-"$INITD"
}
# Turn on bluetooth by default
enable bluetoothd
