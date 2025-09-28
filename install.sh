#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon

sudo xbps-install -Syvu < packages.txt

sudo ln -s /etc/sv/{dbus,NetworkManager,lightdm,avahi-daemon} /var/service/ && sudo sv up dbus NetworkManager lightdm avahi-daemon

brew install nvim oh-my-posh clcokify-cli

cd ~/system_z6/ 

cp -r .bashrc .config .mpd .ncmpcpp .themes Downloads app code img ~/

cd Downloads
mkdir Hacker-C && tar -xzf Hacker-C.tar.gz -C Hacker-C
mkdir Midnight-Green && 7z x Midnight-Green.7z -oMidnight-Green
mkdir Ubuntu-Mono-Dark-Green && tar -xzf Ubuntu-Mono-Dark-Green.tar.gz -C Ubuntu-Mono-Dark-Green

sudo cp -r Hacker-C Midnight-Green Ubuntu-Mono-Dark-Green /usr/share/icons/

cd ~/

for repo in \
  https://github.com/z6death/z3.git \
  https://github.com/z6death/zvim.git \
  https://github.com/z6death/z6.git \
  https://github.com/z6death/zpoly.git \
  https://github.com/z6death/zmux.git \
  https://github.com/z6death/zbat.git \
  https://github.com/z6death/kitty_z6.git \
  https://github.com/z6death/zute.git \
  https://github.com/z6death/z6_sh.git
do
  git clone $repo
done

cp -r z3/* ~/.config/i3/
cp -r zvim/* ~/.config/nvim/
cp -r zpoly/* ~/.config/polybar/
cp -r zmux/* ~/
cp -r zbat/* ~/.config/bat/
cp -r kitty_z6/* ~/.config/kitty/
cp -r zute/* ~/.config/qutebrowser/


