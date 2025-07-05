#!/bin/bash
yay -S --noconfirm --needed docker docker-compose

# Limit log size to avoid running out of disk
sudo mkdir -p /etc/docker
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Start Docker automatically
if [[ "$ARTIX" == "true" ]]
then
  yay -S --noconfirm --needed docker-"$INITD"
  sudo dinitctl enable dockerd
else
  sudo systemctl enable dockerd
fi

# Give this user privileged Docker access
sudo usermod -aG docker "${USER}"
