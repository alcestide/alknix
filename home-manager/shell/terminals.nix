{pkgs,...}:
{
  programs = {
  /*
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
  */
    foot = {
      enable = true;
      catppuccin.enable = true;
      settings.main.font =  "Fira Code:size=14";
      settings.main.term = "xterm-256color";
    };
  };
}
