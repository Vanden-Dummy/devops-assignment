#!/bin/bash

port=$(kubectl get service | grep frontend | tr -s ' ' | cut -d ' ' -f 5 | cut -d ':' -f 2 | cut -d '/' -f 1)
echo "port is $port"

ip=$(kubectl get nodes -o wide | head -n 2 | awk '{print $7}' | sed -n 2p)
echo "ip is $ip"

echo "NODE_PORT=$port" >> $GITHUB_ENV
echo "NODE_IP=$ip" >> $GITHUB_ENV
