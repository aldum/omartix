#!/bin/bash

unset ARTIX
source /etc/os-release
if [[ "$ID" == "artix" ]]
then
  ARTIX=true
  INITD=dinit
  INITCTL=dinitctl
  export ARTIX
  export INITD
fi

enable() {
  if [[ "$ARTIX" == "true" ]]
  then    
    sudo "$INITCTL" enable "$@"
  else
    sudo systemctl enable "$@"
  fi
}