#!/bin/bash
sudo docker image prune -f
sudo docker stop $(sudo docker ps -q)
sudo docker container prune -f
sudo docker build -t dbms .