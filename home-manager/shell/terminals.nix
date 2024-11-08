{pkgs,...}:
{
  programs = {
  alacritty = {
	    enable = true;
        catppuccin.enable = true;
	    settings = {
	    env.TERM = "xterm-256color";
        font = {
                  size = 12;
		normal = {
		family = "Fira Code";
	      };};
	      shell = {
		program = "zsh";
		};
  	      window.opacity = 0.7;
	      scrolling.multiplier = 5;
	      selection.save_to_clipboard = true;
	    };
      };

    kitty =  {
      enable = true;
      font.name = "Fira Code";
      catppuccin.enable = true;
      settings = {
        confirm_os_window_close = 0;
      };
    };

    foot = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
