{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        # Unmap space (leader)
        action = "<nop>";
        key = "<Leader>";
        options = {
          noremap = true;
          silent = true;
        };
        mode = "n";
      }
      {
        action = "<cmd>sp<CR><C-w>j";
        key = "<Leader>-";
        options.silent = true;
        options.desc = "Split window horizontally";
      }
      {
        action = "<cmd>vsp<CR><c-w>l";
        key = "<Leader>\\";
        options.silent = true;
        options.desc = "Split window vertically";
      }
      {
        action = "<cmd>ZenMode<CR>";
        key = "<Space>wz";
        options = {
          silent = true;
          noremap = true;
          desc = "Zen mode";
        };
      }
      {
        action = "<C-w>h";
        key = "<C-h>";
        options = {
          silent = true;
          noremap = true;
          desc = "Move to left window";
        };
      }
      {
        action = "<C-w>j";
        key = "<C-j>";
        options = {
          silent = true;
          noremap = true;
          desc = "Move to lower window";
        };
      }
      {
        action = "<C-w>k";
        key = "<C-k>";
        options = {
          silent = true;
          noremap = true;
          desc = "Move to upper window";
        };
      }
      {
        action = "<C-w>l";
        key = "<C-l>";
        options = {
          silent = true;
          noremap = true;
          desc = "Move to right window";
        };
      }
      {
        action = "<cmd>close<CR>";
        key = "<Leader>wd";
        options = {
          silent = true;
          noremap = true;
          desc = "Close current window";
        };
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<Leader>ff";
        options = {
          silent = true;
          noremap = true;
          desc = "Find files";
        };
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<Leader>/";
        options = {
          silent = true;
          noremap = true;
          desc = "Live grep";
        };
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<Leader>fb";
        options = {
          silent = true;
          noremap = true;
          desc = "List buffers";
        };
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<Leader>fh";
        options = {
          silent = true;
          noremap = true;
          desc = "Help tags";
        };
      }
      {
        action = "<cmd>lua require'telescope.builtin'.lsp_definitions{}<CR>";
        key = "gd";
        options = {
          silent = true;
          noremap = true;
          desc = "Go to definition";
        };
      }
      {
        action = "<cmd>lua require'telescope.builtin'.git_files{}<CR>";
        key = "<Leader> ";
        options = {
          silent = true;
          noremap = true;
          desc = "List Git files";
        };
      }
      {
        action = "<cmd>lua require'telescope.builtin'.find_files{}<CR>";
        key = "<Leader>ff";
        options = {
          silent = true;
          noremap = true;
          desc = "List all files";
        };
      }
      {
        action = "<C-\\><C-n>";
        key = "<C-Esc>";
        options = {
          silent = true;
          noremap = true;
          desc = "Go to normal mode in built-in terminal.";
        };
        mode = "t";
      }
      {
        action = ":resize +4<CR>";
        key = "<Leader>w=";
        options = {
          silent = true;
          noremap = true;
          desc = "Increase window height.";
        };
      }
      {
        action = ":resize -4<CR>";
        key = "<Leader>w-";
        options = {
          silent = true;
          noremap = true;
          desc = "Decrease window height.";
        };
      }
      {
        action = ":vertical resize +4<CR>";
        key = "<Leader>w]";
        options = {
          silent = true;
          noremap = true;
          desc = "Increase window width.";
        };
      }
      {
        action = ":vertical resize -4<CR>";
        key = "<Leader>w[";
        options = {
          silent = true;
          noremap = true;
          desc = "Decrease window width.";
        };
      }
      {
        action = ":Bdelete!<CR>";
        key = "<Leader>bd";
        options = {
          silent = true;
          noremap = true;
          desc = "Close buffer";
        };
      }
      {
        action = ":bprev<CR>";
        key = "H";
        options = {
          silent = true;
          noremap = true;
          desc = "Move to the previous buffer.";
        };
      }
      {
        action = ":bnext<CR>";
        key = "L";
        options = {
          silent = true;
          noremap = true;
          desc = "Move to the next buffer.";
        };
      }
      {
        action = ":LazyGit<CR>";
        key = "<Leader>gg";
        options = {
          silent = true;
          noremap = true;
          desc = "Open LazyGit";
        };
      }
      {
        action = ":split | wincmd j | resize 15 | term<CR>";
        key = "<Leader>tt";
        options = {
          silent = true;
          noremap = true;
          desc = "Open a half-size horizontal terminal split";
        };
        mode = "n";
      }
      {
        action = ":split | wincmd j | term<CR>";
        key = "<Leader>te";
        options = {
          silent = true;
          noremap = true;
          desc = "Open a horizontal terminal split";
        };
        mode = "n";
      }
      {
        action = ":vsplit | wincmd l | term<CR>";
        key = "<Leader>tv";
        options = {
          silent = true;
          noremap = true;
          desc = "Open a vertical terminal split";
        };
        mode = "n";
      }
      {
        action = ":Trouble diagnostics<CR>";
        key = "<Leader>xx";
        options = {
          silent = true;
          noremap = true;
          desc = "View trouble diagnostics";
        };
        mode = "n";
      }
      {
        action = ":Trouble symbols<CR>";
        key = "<Leader>xs";
        options = {
          silent = true;
          noremap = true;
          desc = "View symbols";
        };
        mode = "n";
      }
      {
        action = "<Plug>(YankyPutAfter)";
        key = "p";
        mode = ["n" "x"];
      }
      {
        action = "<Plug>(YankyPutBefore)";
        key = "P";
        mode = ["n" "x"];
      }
      {
        action = "<Plug>(YankyGPutAfter)";
        key = "gp";
        mode = ["n" "x"];
      }
      {
        action = "<Plug>(YankyGPutBefore)";
        key = "gP";
        mode = ["n" "x"];
      }
      {
        action = ":Telescope yank_history<CR>";
        key = "<Leader>p";
        mode = "n";
      }
      {
        action = '':lua require("yazi").yazi()<CR>'';
        key = "<Leader>mm";
        options = {
          desc = "Open Yazi current nvim working directory";
          noremap = true;
          silent = true;
        };
      }
      {
        action = '':lua vim.lsp.buf.code_action()<CR>'';
        key = "<Leader>ca";
        options = {
          desc = "View available code actions";
          noremap = true;
          silent = true;
        };
      }
      {
        action = '':lua vim.lsp.buf.rename()<CR>'';
        key = "<Leader>cr";
        options = {
          desc = "Rename symbol";
          noremap = true;
          silent = true;
        };
      }
      {
        action = '':lua require("lsp_lines").toggle()<CR>'';
        key = "<Leader>cd";
        options = {
          desc = "Toggle lsp lines";
          noremap = true;
          silent = true;
        };
      }
      # {
      #   action = ":Yazi<CR>";
      #   key = "<Leader>mf";
      #   options = {
      #     desc = "Open Yazi at current file";
      #     noremap = true;
      #     silent = true;
      #   };
      # }
      # {
      #   action = "<cmd>lua require'conform'.format({ bufnr = args.bf })<CR>";
      #   key = "<Leader>cf";
      #   options = {
      #     silent = true;
      #     noremap = true;
      #     desc = "Format buffer";
      #   };
      # }
    ];
  };
}
