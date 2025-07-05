#!/bin/bash
if [[ "$ARTIX" == "true" ]]
then
  sudo pacman -S --noconfirm artix-archlinux-support archlinux-mirrorlist
  cat >> /etc/pacman.conf << EOF
##########
## ARCH ##
##########
[extra]
Include = /etc/pacman.d/mirrorlist-arch
EOF
fi
