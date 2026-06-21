# PipeWire Config for RODECaster Pro II

PipeWire and WirePlumber configuration for the RODE RODECaster Pro II on Linux.

> **Credit:** The original configuration files and documentation were created by
> **[Jordan Milner](https://github.com/Jordan-Milner)** — see the upstream repo at
> [github.com/Jordan-Milner/rodecaster-pro2-pipewire](https://github.com/Jordan-Milner/rodecaster-pro2-pipewire).
> This is a fork/mirror maintained at
> [github.com/kurobeats/Pipewire-Config-for-Rodecaster-Pro-II](https://github.com/kurobeats/Pipewire-Config-for-Rodecaster-Pro-II).

## Features

- Automatically sets the **Pro Audio** profile exposing all channels
- Renames devices to match Windows naming convention:
  - **RODECaster Pro II - USB 1 Main** — Primary stereo input/output
  - **RODECaster Pro II - USB 1 Chat** — Dedicated channel for Discord/Skype/communication apps
  - **RODECaster Pro II - Multitrack** — 16-channel input for individual fader recording

## Requirements

- **PipeWire** (audio server)
- **WirePlumber 0.5.x+** (session manager)

Most modern Linux distributions (Fedora 39+, Ubuntu 24.04+, Arch, etc.) ship with compatible versions. Check your version with `wireplumber --version`.

## Installation

### Quick Setup (any distro)

```bash
bash setup.sh
```

This downloads the config files and copies them to the correct system directories.

### Manual Installation

```bash
# Download configs
wget https://raw.githubusercontent.com/kurobeats/Pipewire-Config-for-Rodecaster-Pro-II/refs/heads/main/50-rodecaster-pro2.conf -O /tmp/50-rodecaster-pro2.conf
wget https://raw.githubusercontent.com/kurobeats/Pipewire-Config-for-Rodecaster-Pro-II/refs/heads/main/51-rodecaster-pro2-rename.conf -O /tmp/51-rodecaster-pro2-rename.conf

# Copy to system directories
sudo cp /tmp/50-rodecaster-pro2.conf /usr/share/pipewire/pipewire.conf.d/
sudo cp /tmp/51-rodecaster-pro2-rename.conf /usr/share/wireplumber/wireplumber.conf.d/
```
### After Installation

Restart PipeWire and WirePlumber:

```bash
systemctl --user restart wireplumber pipewire pipewire-pulse
```

Or simply reconnect your RODECaster Pro II.

## Audio Channels

After installation, your RODECaster Pro II will expose:

| Name | Type | Description |
|------|------|-------------|
| RODECaster Pro II - USB 1 Main | Output | Send audio to the RODECaster main mix |
| RODECaster Pro II - USB 1 Chat | Output | Send audio to the RODECaster chat channel (for Discord, etc.) |
| RODECaster Pro II - USB 1 Main | Input | Receive the main stereo mix from RODECaster |
| RODECaster Pro II - Multitrack | Input | Receive all 16 individual channels for multitrack recording |

## Troubleshooting

### Device not detected

Check if the device is recognized:

```bash
lsusb | grep -i rode
```

If not showing, try:
1. Reconnect the USB cable
2. Try a different USB port (preferably USB 3.0)
3. Check `journalctl -b | grep -i rode` for errors

### Channels not renamed

Verify WirePlumber loaded the config:

```bash
wpctl status
```

If names are still generic, restart WirePlumber:

```bash
systemctl --user restart wireplumber
```

## License

MIT — original work by [Jordan Milner](https://github.com/Jordan-Milner). 
