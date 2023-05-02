#!/bin/bash

# installing sample tools
# anything that needs to be installed on the host machine can be added here

sudo apt-get update -y
sudo apt-get install -y build-essential curl git libssl-dev man --no-install-recommends
sudo apt-get install resolvconf htop
