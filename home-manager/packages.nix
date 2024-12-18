{pkgs,config,lib,...}:

  {
  home.packages = with pkgs; [
	    nixos-generators
        nix-search-cli
        nix-output-monitor
        nix-init
        lxde.lxsession
        gtk-engine-murrine
        pkg-config
        zsh
        oh-my-zsh
        zip
        xz
        unzip
        unrar
        p7zip
        ripgrep
        psmisc
        fzf
        gnupg
        brightnessctl
        brillo
        wol
        mtr
        iperf
        dnsutils
        nmap
        ipcalc
        tree
        lsof
        sysstat
        lm_sensors
        ncdu
        ethtool
        pciutils
        usbutils
        qrencode
        stress-ng
        pptp
        pptpd
        ppp
        jq
        yq-go
        gh
        calc
        calcure
        python3
        gnumake
        nodejs
        rustup
        hugo
        go
        eza
        zoxide
        grim
        slurp
        swappy
        xclip
        feh
        pywal
        wofi
        xwayland
        wayland-scanner
        wl-clipboard
        waybar
        clipman
        wlsunset
        wdisplays
        wireguard-tools
        yt-dlp
        gallery-dl
        ani-cli
        playerctl
        pulseaudio
        coreutils-prefixed
        dunst
        libnotify
        hyprshot
        hyprcursor
        nwg-look
        swtpm
        ueberzugpp
        ffmpegthumbnailer
        w3m
        pulsemixer
        xboxdrv

        # [Desktop Apps]
        gnome-terminal
        gnome-tweaks
        pavucontrol
        pasystray
        blueman
        calibre
        libreoffice
        firefox
        freetube
        obsidian
        feishin
        telegram-desktop
        #heroic
        filezilla
        remmina
        tigervnc
        transmission_4-gtk
        gimp
        font-manager
        zathura
        nicotine-plus
        #picard
        #lutris
        #duckstation
        #pcsx2
        obs-studio
        obs-studio-plugins.wlrobs
        obs-studio-plugins.obs-pipewire-audio-capture

      ];
    }
