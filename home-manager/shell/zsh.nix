{pkgs,...}:
{
  programs = {
    zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
            sudo = "sudo ";
            g = "git";
            c = "clear";
            h = "history";
            vim = "nvim";
            ls = "exa";
            ll = "exa -l";
            r = "ranger";
            y = "yazi";
		    rb = "sudo nixos-rebuild switch";
            nowdate="date +'%d-%m-%Y'";
            nixvim = "nix run github:alcestide/nixvim --";
            wakehomelab="/usr/bin/wakeonlan 10:BF:48:BA:48:1D";
            garb = "sudo nix-collect-garbage --delete-older-than 1d";
            pptp-lecce = "pon pptp-lecce debug dump logfd 2 updetach && sudo ip route add 172.16.10.0/24 dev ppp0";
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

    };
}
