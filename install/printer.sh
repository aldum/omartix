#!/bin/bash
sudo pacman -S --noconfirm cups cups-pdf cups-filters system-config-printer
if [[ "$ARTIX" == "true" ]]
then
  sudo dinitctl enable cupsd
else
  sudo systemctl enable cups
fi
