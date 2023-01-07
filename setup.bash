#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Installing dependencies.."
apt install curl git vim -y

echo "Installiing docker.."
curl -fsSL get.docker.com | bash
usermod -aG docker $USER
docker volume create sda

echo "Installing docker-compose.."
(
  COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
  curl -SL https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-linux-x86_64 -o /tmp/docker-compose && chmod +x /tmp/docker-compose
  mv /tmp/docker-compose /usr/local/bin/docker-compose
)

echo "Installing lazydocker.."
export DIR=/usr/local/bin
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
