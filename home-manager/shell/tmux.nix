{pkgs,...}:
  {
    programs.tmux = {
		enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
		baseIndex = 1;
		escapeTime = 0;
        #mouse = true;
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
            set -g status-fg white\n
            set -s set-clipboard on";
	};
  }
