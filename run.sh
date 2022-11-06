#!/bin/bash

FOLD_PATH="/home/gokul/OracleSQL/shared/"

sudo docker container prune -f
clear
echo "Starting Oracle Linux container.."
echo ""$FOLD_PATH":"/shared/""
sudo docker run --name "OracleSQL" -v "$FOLD_PATH":"/shared/" -it dbms
echo "EXIT from container"
