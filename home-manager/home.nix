{inputs, outputs, config, pkgs, ... }:

{
  home = {
    username = "alcestide";
    homeDirectory = "/home/alcestide";
      packages = with pkgs; [
        nix-search-cli
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
        psmisc 
        fzf    
        mtr    
        iperf
        dnsutils      
        nmap    
        ipcalc  
        tree
        nix-output-monitor
        lsof
        sysstat
        lm_sensors 
        ethtool
        pciutils 
        usbutils
        telegram-desktop
        feishin
        feh
        rofi
	    pywal
      ];

    };

  programs = {
	git = {
	    enable = true;
	    userName = "Angelo Panariti";
	    userEmail = "angpanariti@gmail.com";
	  };
	tmux = {
		enable = true;
		shell = "${pkgs.zsh}/bin/zsh";
		baseIndex = 1;
		escapeTime = 0;
		mouse = true;
		keyMode = "vi";
		terminal = "tmux-256color";
		historyLimit = 100000;
		extraConfig = "
			bind | split-window -h\n
			bind - split-window -v\n
			bind -n M-Left select-pane -L\n
			bind -n M-Right select-pane -R\n
			bind -n M-Up select-pane -U\n
			bind -n M-Down select-pane -D\n
			set -g visual-activity off\n
			set -g visual-bell off\n
			set -g visual-silence off\n
			setw -g monitor-activity off\n
			set -g bell-action none\n
			set -g status-position bottom\n
			set -g status-justify left\n
			set -g status-right-length 50\n
			set -g status-left-length 10\n";
	};

	zsh = {
		enable = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
		    sudo = "sudo ";
		    garb = "sudo nix-collect-garbage --delete-older-than 1d";
            vim = "nix run github:alcestide/nixvim";
            ls = "exa -la";
		    ll = "ls -l";
		    rb = "sudo nixos-rebuild switch";
		  };
		oh-my-zsh = {
		  enable = true;
		  plugins = [ ];
		  theme = "agnoster";
		};
		history = {
		size = 10000;
		};
	};

	alacritty = {
	    enable = true;
	    settings = {
	      env.TERM = "xterm-256color";
	      font = {
		normal = {
		family = "Fira Code";
	      };};
	      shell = {
		program = "zsh";
		};
	      scrolling.multiplier = 5;
	      selection.save_to_clipboard = true;
	    };
	  };

  };


  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
