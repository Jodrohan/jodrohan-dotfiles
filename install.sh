#!/usr/bin/env bash
set -euo pipefail

echo ":: [1/4] Restoring system packages from pkglist..."
if [[ -f "$HOME/system-backup/pkglist.txt" ]]; then
    sudo pacman -S --needed - < "$HOME/system-backup/pkglist.txt" || true
fi

echo ":: [2/4] Restoring keyd hardware remap config..."
if [[ -f "$HOME/system-backup/default.conf" ]]; then
    sudo mkdir -p /etc/keyd
    sudo cp -f "$HOME/system-backup/default.conf" /etc/keyd/default.conf
    sudo systemctl enable --now keyd.service || true
fi

echo ":: [3/4] Restoring NetworkManager IWD & Wi-Fi PowerSave config..."
if [[ -f "$HOME/system-backup/wifi_backend.conf" ]]; then
    sudo mkdir -p /etc/NetworkManager/conf.d
    sudo cp -f "$HOME/system-backup/wifi_backend.conf" /etc/NetworkManager/conf.d/wifi_backend.conf
    sudo systemctl stop wpa_supplicant.service 2>/dev/null || true
    sudo systemctl mask wpa_supplicant.service
    sudo systemctl enable --now iwd.service
    sudo systemctl restart NetworkManager.service
fi

echo ":: [4/4] Bootstrap complete!"
