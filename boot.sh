#!/bin/bash

ascii_art='
 ▄██████▄    ▄▄▄▄███▄▄▄▄      ▄████████    ▄████████  ▄████████    ▄█    █▄    ▄██   ▄
███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███   ███    ███ ███    ███   ███    ███   ███   ██▄
███    ███ ███   ███   ███   ███    ███   ███    ███ ███    █▀    ███    ███   ███▄▄▄███
███    ███ ███   ███   ███   ███    ███  ▄███▄▄▄▄██▀ ███         ▄███▄▄▄▄███▄▄ ▀▀▀▀▀▀███
███    ███ ███   ███   ███ ▀███████████ ▀▀███▀▀▀▀▀   ███        ▀▀███▀▀▀▀███▀  ▄██   ███
███    ███ ███   ███   ███   ███    ███ ▀███████████ ███    █▄    ███    ███   ███   ███
███    ███ ███   ███   ███   ███    ███   ███    ███ ███    ███   ███    ███   ███   ███
 ▀██████▀   ▀█   ███   █▀    ███    █▀    ███    ███ ████████▀    ███    █▀     ▀█████▀
                                          ███    ███                                    '

echo -e "\n$ascii_art\n"

sudo pacman -Sy --noconfirm --needed git

source /etc/os-release
if [[ "$ID" == "artix" ]]
then
  ARTIX=true
  export INITD
fi

REPO="https://github.com/basecamp/omarchy.git"
if [[ "$ARTIX" == "true" ]]
then
  REPO="https://github.com/aldum/omartix.git"
  OMARCHY_REF=artix
  ~/.local/share/omarchy/install/0-arch
fi

echo -e "\nCloning Omarchy..."
rm -rf ~/.local/share/omarchy/
git clone --depth=1 "$REPO" ~/.local/share/omarchy >/dev/null

[[ "$ARTIX" == "true" ]] && ~/.local/share/omarchy/install/0-arch

# Use custom branch if instructed
if [[ -n "$OMARCHY_REF" ]]; then
  echo -e "\eUsing branch: $OMARCHY_REF"
  (cd ~/.local/share/omarchy && \
    git fetch origin "${OMARCHY_REF}" && git checkout "${OMARCHY_REF}")
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omarchy/install.sh

