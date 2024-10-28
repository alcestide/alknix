# ❄️ ALK's NixOS configuration ❄️

[![License](https://img.shields.io/github/license/alcestide/nixos)](https://en.wikipedia.org/wiki/Unlicense)
[![Written in Nix](https://img.shields.io/badge/code-nix-blue)](https://nixos.org/)
[![NixOS Unstable](https://img.shields.io/badge/NixOS-24.05-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)
[![GitHub last commit](https://img.shields.io/github/last-commit/alcestide/nixos)](#)
[![Free](https://img.shields.io/badge/free_for_non_commercial_use-brightgreen)](#-license)
---
![Screenshot_20241027-151705](https://github.com/user-attachments/assets/a46fb958-461d-4bc5-a15d-0377ce170ff1)

# Structure
```markdown
.
.
├── horus
│   ├── derivations
│   │   └── sddm-theme.nix
│   ├── flake.lock
│   ├── flake.nix
│   ├── global
│   │   ├── bootloader.nix
│   │   ├── configuration.nix
│   │   ├── fonts.nix
│   │   ├── hardware-configuration.nix
│   │   ├── networking.nix
│   │   ├── programs.nix
│   │   └── services.nix
│   ├── home-manager
│   │   ├── dunst
│   │   │   ├── dunst.nix
│   │   │   └── dunstrc
│   │   ├── gtk.nix
│   │   ├── home.nix
│   │   ├── hypr
│   │   │   ├── assets
│   │   │   │   ├── dark-cat-rosewater.png
│   │   │   │   └── nix-catppuccin.png
│   │   │   ├── hyprland.conf
│   │   │   ├── hyprlock.conf
│   │   │   ├── hypr.nix
│   │   │   ├── mocha.conf
│   │   │   └── waybar
│   │   │       ├── config
│   │   │       └── style.css
│   │   ├── packages.nix
│   │   ├── programs.nix
│   │   └── qt.nix
│   └── LICENSE
├── LICENSE
├── osiris
│   ├── flake.nix
│   ├── global
│   │   ├── configuration.nix
│   │   ├── hardware-configuration.nix
│   │   ├── networking.nix
│   │   ├── services.nix
│   │   └── virtualisation.nix
│   └── home-manager
│       ├── home.nix
│       └── packages.nix
└── README.md
```

| Type           | Program      |
| :------------- | :----------: |
| Editor         | [Nixvim](https://github.com/nix-community/nixvim) |
| Shell          | [Zsh](https://ohmyz.sh/) |
| Terminal       | [Alacritty](https://alacritty.org/) |
| Window Manager | [Hyprland](https://hyprland.org/) |
| GTK Theme      |  Pale Night |
| GTK Icon Theme | [Rose-pine](https://github.com/rose-pine/gtk) |
