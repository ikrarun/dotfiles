#!/bin/bash
set -e

echo "🔄 Updating system..."
sudo pacman -Syu --noconfirm

echo "📦 Installing dev tools + paru..."
sudo pacman -S --noconfirm git base-devel
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si --noconfirm

echo "🌿 Installing Hyprland stack..."
paru -S --noconfirm hyprland hyprpaper swaync waybar dunst \
  ghostty rofi nemo network-manager-applet \
  pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol \
  xdg-desktop-portal-hyprland qt5-wayland qt6-wayland \
  wl-clipboard xwayland ttf-jetbrains-mono-nerd \
  fish starship neofetch btop unzip jq \
  firefox vlc obs-studio chezmoi nix





echo "🔐 Installing and enabling 'ly' login manager..."
paru -S --noconfirm ly
sudo systemctl enable ly

echo "🌐 Enabling NetworkManager..."
sudo systemctl enable NetworkManager

echo "📁 Applying your chezmoi-managed dotfiles..."
chezmoi init https://github.com/ikrarun/dotfiles.git
chezmoi apply

echo "🐟 Setting default shell to fish..."
chsh -s $(which fish)

echo "✅ Setup complete! Reboot and enjoy your custom Hyprland world!"
