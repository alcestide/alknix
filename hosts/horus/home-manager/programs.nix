{pkgs,inputs, ... }:

{
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
		keyMode = "emacs";
		terminal = "xterm-256colo";
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
			set-option -g  default-terminal 'xterm-256color'\n
			set-option -ga terminal-overrides ',xterm-256color:Tc'\n
            set -g status-left-length 10\n
            set -g status-bg black\n
            set -g status-fg white";
	};

	zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
		    sudo = "sudo ";
		    garb = "sudo nix-collect-garbage --delete-older-than 1d";
            vim = "nvim";
            nixvim = "nix run github:alcestide/nixvim --";
            ls = "exa";
            ll = "exa -l";
            r = "ranger";
		    rb = "sudo nixos-rebuild switch";
            pptp-lecce = "sudo pon pptp-lecce debug dump logfd 2 updetach";
		  };
		oh-my-zsh = {
		  enable = true;
		  plugins = [ ];
          theme = "agnoster";
          /*
        extraConfig = "
        if [ "$TERM" = "xterm-256color" ]; then'\n'
        ZSH_THEME="agnoster"'\n'
          else'\n'
        ZSH_THEME="robbyrussell"'\n'
          fi'\n'
        ""*/
        };

		history = {
		size = 10000;
      };
      #initExtra = "(cat ~/.cache/wal/sequences)\n";
      };

	alacritty = {
	    enable = true;
        catppuccin.enable = true;
	    settings = {
	    env.TERM = "xterm-256color";
	      font = {
		normal = {
		family = "Fira Code";
	      };};
	      shell = {
		program = "zsh";
		};
	     # import = ["/etc/nixos/home-manager/catppuccin-mocha.toml"];
  	      window.opacity = 0.7;
	      scrolling.multiplier = 5;
	      selection.save_to_clipboard = true;
	    };
	  };

      firefox = {
        enable = true;
      };
      
      #waybar.enable = true;
      ranger = {
        enable = true;
        extraConfig = "set preview_images true\nset preview_images_method ueberzug";
      };


    };
    }
