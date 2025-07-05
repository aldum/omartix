#!/bin/bash
sudo pacman -S --noconfirm cups cups-pdf cups-filters system-config-printer

if [[ "$ARTIX" == "true" ]]
then
  sudo pacman -S --noconfirm cups-"$INITD"
  enable cupsd
else
  enable cups
fi
