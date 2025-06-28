#!/bin/bash

# Check if any wifi device is soft blocked
if rfkill list wifi | grep -q "Soft blocked: yes"; then
  echo '{"text": "AirPlaneMode[ON]", "tooltip": "Airplane Mode On", "class": "on"}'
else
  echo '{"text": "AirPlaneMode[OFF]", "tooltip": "Airplane Mode Off", "class": "off"}'

fi

