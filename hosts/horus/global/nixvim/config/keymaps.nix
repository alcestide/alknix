{self, ...}: {
  keymaps = [
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>e";
    }

    {
      action = "<cmd>FzfLua files<CR>";
      key = "<leader>ff";
    }
    {
      action = "<cmd>FzfLua live_grep<CR>";
      key = "<leader>fg";
    }
    
    {
      action = "<cmd>FzfLua buffers<CR>";
      key = "<leader>fb";
    }

    {
      action = "<cmd>FzfLua oldfiles<CR>";
      key = "<leader>fh";
    }

    {
      action = "<cmd>FzfLua builtin<CR>";
      key = "<leader>fz";
    }
    {
      action = "<cmd>UndotreeToggle<CR>";
      key = "<F5>";
    } 
    {
      action = "<cmd>ToggleTerm<CR>";
      key = "<leader>t";
    }

    {
      action = "<cmd>:lua vim.lsp.buf.hover()<CR>";
      key = "K";
    }
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer";
      };
    }
  ];
}

