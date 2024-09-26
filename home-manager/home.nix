{pkgs, ... }:

{

  imports = [
    ./dunst/dunst.nix
    ./gtk.nix
    ./user-programs.nix
    ];

  home = {
    username = "alcestide";
    homeDirectory = "/home/alcestide";
    sessionVariables = { 
        HYPRSHOT_DIR="/home/alcestide/Pictures/Screenshots";
    };

    packages = with pkgs; [
	nixos-generators
        nix-search-cli
        nix-output-monitor
        zsh
        oh-my-zsh
        zip
        xz
        unzip
        p7zip
        ripgrep
        jq     
        yq-go    
        eza
        zoxide
        ranger
        gnomeExtensions.dash-to-dock
        cinnamon.nemo-with-extensions
        xfce.thunar
        firefox
        telegram-desktop
	    filezilla
        obsidian
        flameshot
        redshift
        psmisc 
        fzf    
        mtr    
        iperf
        dnsutils      
        nmap    
        ipcalc  
        tree
        lsof
        sysstat
        lm_sensors 
        ethtool
        pciutils 
        usbutils
        feishin
        font-manager
        feh
        pywal
        pavucontrol
        polybar
        waybar
	    wofi
        hyprpaper
        nwg-look
        libnotify
        dunst
	    xwayland
	    wl-clipboard
        playerctl
	    pulseaudio
	    coreutils-prefixed
	    grim
	    slurp
	    swappy
	    xclip
	    hyprshot
      ];

    };

  qt.enable = true;
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
