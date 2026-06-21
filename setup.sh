#!/usr/bin/env bash
#
# PipeWire/WirePlumber setup for RODE RODECaster Pro II
# Downloads config files and installs them to the system directories.
#
# Original configs authored by Jordan Milner:
#   https://github.com/Jordan-Milner/rodecaster-pro2-pipewire
#
# This script downloads from the kurobeats fork mirror:
#   https://github.com/kurobeats/Pipewire-Config-for-Rodecaster-Pro-II

set -euo pipefail

REPO_BASE="https://raw.githubusercontent.com/kurobeats/Pipewire-Config-for-Rodecaster-Pro-II/refs/heads/main"

FILES=(
  "50-rodecaster-pro2.conf"
  "51-rodecaster-pro2-rename.conf"
)

echo "==> Downloading config files to /tmp ..."
for f in "${FILES[@]}"; do
  echo "    -> $f"
  wget -q "${REPO_BASE}/${f}" -O "/tmp/${f}"
done

echo ""
echo "==> Installing PipeWire config ..."
sudo cp /tmp/50-rodecaster-pro2.conf /usr/share/pipewire/pipewire.conf.d/

echo "==> Installing WirePlumber rename config ..."
sudo cp /tmp/51-rodecaster-pro2-rename.conf /usr/share/wireplumber/wireplumber.conf.d/

echo ""
echo "==> Done! Restart PipeWire and WirePlumber to apply:"
echo "    systemctl --user restart wireplumber pipewire pipewire-pulse"
echo ""
echo "Or simply reconnect your RODECaster Pro II."
