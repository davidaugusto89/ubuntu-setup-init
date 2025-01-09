#!/bin/bash

# -----------------------------
# Setup.sh - Script de Pós-Instalação
# -----------------------------

# Defina seu e-mail aqui
EMAIL="EMAIL@EXAMPLE.COM"

# Lista de etapas
steps=(
  "Atualizando pacotes do sistema"
  "Instalando pacotes essenciais"
  "Configurando tema e dock"
  "Instalando Node.js, pnpm e CLIs"
  "Instalando Docker e corrigindo permissões"
  "Ajustando a ordem dos monitores"
  "Instalando navegadores (Chrome e Brave)"
  "Instalando DBeaver"
  "Instalando Composer e PHP CLI"
  "Desabilitando Apache2 e PHP"
  "Instalando Oh My Zsh"
  "Instalando Flameshot e configurando atalho"
  "Instalando Gedit, dbus-launch e tema Dracula"
  "Configurando favoritos da Dock"
  "Configurando Git e SSH"
  "Configurando Zsh como terminal padrão"
  "Finalizando a configuração"
)
total_steps=${#steps[@]}

# Função para exibir a barra de progresso
show_progress() {
  local step=$1
  local percent=$(( (step * 100) / total_steps ))
  printf "\r[%-50s] %d%% - Etapa %d/%d: ${steps[$((step - 1))]}" \
    $(printf '#%.0s' $(seq 1 $((step * 50 / total_steps)))) \
    $percent $step $total_steps
}

# Etapa 1: Atualizando pacotes do sistema
show_progress 1
sudo apt update && sudo apt upgrade -y
sleep 1

# Etapa 2: Instalando pacotes essenciais
show_progress 2
sudo apt install -y git curl zsh build-essential wget gpg unzip
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
sleep 1

# Etapa 3: Configurando tema e dock
show_progress 3
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-blue'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/Northan_lights_by_mizuno.webp'
gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/Northan_lights_by_mizuno.webp'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
sleep 1

# Etapa 4: Instalando Node.js, pnpm e CLIs
show_progress 4
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
npm install -g pnpm
pnpm add -g nve @nestjs/cli @laravel/installer
sleep 1

# Etapa 5: Instalando Docker e corrigindo permissões
show_progress 5
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
sleep 1

# Etapa 6: Ajustando a ordem dos monitores
show_progress 6
xrandr --output HDMI-1 --left-of eDP-1
sleep 1

# Etapa 7: Instalando navegadores (Chrome e Brave)
show_progress 7
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser
sleep 1

# Etapa 8: Instalando DBeaver
show_progress 8
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt install -y dbeaver-ce
sleep 1

# Etapa 9: Instalando Composer e PHP CLI
show_progress 9
sudo apt install -y php-cli
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sleep 1

# Etapa 10: Desabilitando Apache2 e PHP
show_progress 10
sudo systemctl stop apache2
sudo systemctl disable apache2
sudo systemctl disable php*-fpm
sleep 1

# Etapa 11: Instalando Oh My Zsh
show_progress 11
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 1

# Etapa 12: Instalando Flameshot e configurando atalho
show_progress 12
sudo apt install -y flameshot
gsettings set org.gnome.shell.keybindings show-screenshot-ui "[]"

dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ <<EOF
[custom0]
binding='Print'
command='flameshot gui'
name='flameshot'
EOF
sleep 1

# Etapa 13: Instalando Gedit, dbus-launch e tema Dracula
show_progress 13
sudo apt install -y gedit dbus-x11
git clone https://github.com/dracula/gnome-terminal && cd gnome-terminal
./install.sh
cd ..
sleep 1

# Etapa 14: Configurando favoritos da Dock
show_progress 14
gsettings set org.gnome.shell favorite-apps "[]"
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_snap-store.desktop', 'code.desktop', 'org.gnome.Terminal.desktop']"
sleep 1

# Etapa 15: Configurando Git e SSH
show_progress 15
git config --global user.name "David Augusto"
git config --global user.email "$EMAIL"
ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519 -q -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo -e "\nChave SSH gerada! Copie a chave abaixo e adicione ao GitHub:"
cat ~/.ssh/id_ed25519.pub
sleep 1

# Etapa 16: Configurando Zsh como terminal padrão
show_progress 16
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="clean"/' ~/.zshrc
chsh -s $(which zsh)
sleep 1

# Finalizando a configuração
show_progress 17
echo -e "\nConfiguração concluída com sucesso!"
