{self, ...}: {
  globalOpts = {
    undofile = true;
    number = true;
    relativenumber = true;
    signcolumn = "yes";
    ignorecase = true;
    smartcase = true;
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;
    clipboard = "unnamedplus";
    cursorline = true;
    #ruler = true;
    gdefault = true;
    scrolloff = 5;
  };

  globals.mapleader = " ";
   autoCmd = [
     {
       event = [ "BufEnter" "BufWinEnter" ];
       pattern = [ "*.md" "*.mdx" ];
       command = "MarkdownPreviewToggle";
     }
   ];

  highlight = {
    Comment.fg = "#ff00ff";
    Comment.bg = "#000000";
    Comment.underline = true;
    Comment.bold = true;
  };
}
