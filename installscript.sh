#!/bin/bash
# Based off the Spigot Installation Script
#
# Server Files: /mnt/server

apt update
apt install -y curl wget git openssl bash bc apt-transport-https gnupg software-properties-common
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
apt update
mkdir -p /usr/share/man/man1
apt install -y adoptopenjdk-16-hotspot

cd /mnt/server
wget http://ci.sugarcanemc.org/job/SugarcaneUpdater/lastSuccessfulBuild/artifact/build/libs/SugarcaneUpdater.jar
java -jar SugarcaneUpdater.jar --updateSelf --sysjava --branch ${BRANCH}

