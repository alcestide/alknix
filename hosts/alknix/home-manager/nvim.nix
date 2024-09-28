{ pkgs, inputs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      catppuccin.enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        lua-language-server
        gopls
        xclip
        wl-clipboard
        luajitPackages.lua-lsp
        nil
        rust-analyzer
        yaml-language-server
        pyright
        marksman
      ];
    };
  };

}
