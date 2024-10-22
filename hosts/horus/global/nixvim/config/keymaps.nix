{self, ...}: {
  keymaps = [

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
      action = "<cmd>Oil<CR>";
      key = "<C-n>";
    }
    {
      action = "<cmd>Oil<CR>";
      key = "<leader>e";
    }

        {
      action = "<cmd>:lua require('neoscroll').ctrl_u({duration = 250;})<CR>";
      key = "<C-a>";
    }

    {
      action = "<cmd>:lua vim.lsp.buf.hover()<CR>";
      key = "K";
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

