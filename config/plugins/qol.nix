# Quality of life plugins
{ pkgs, inputs, ... }:
{
  extraPackages = with pkgs; [
    ripgrep
    fd
  ];

  plugins = {
    zen-mode.enable = true;
    direnv.enable = true;
    intellitab.enable = true;
    sleuth.enable = true;
    comment.enable = true;
    vim-bbye.enable = true;
    indent-blankline.enable = true;
    which-key = {
      enable = true;
      settings.delay = 1000;
    };
    nvim-autopairs = {
      enable = true;
      luaConfig.post = ''
        local npairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        npairs.add_rules({
          Rule("$", "$",{"tex", "latex", "typst"})
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex("%%"))
            -- don't add a pair if  the previous character is xxx
            :with_pair(cond.not_before_regex("xxx", 3))
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex("xx"))
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none())
          },
          {
          Rule("_", "_","typst")
            -- don't add a pair if  the previous character is xxx
            :with_pair(cond.not_before_regex("[%w%.]", 3))
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex("[%w%.]"))
          },
          {
          Rule("*", "*","typst")
            -- don't add a pair if  the previous character is xxx
            :with_pair(cond.not_before_regex("[%w%.]", 3))
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex("[%w%.]"))
          },
          {
          Rule("$$","$$","tex")
            :with_pair(function(opts)
                print(vim.inspect(opts))
                if opts.line=="aa $$" then
                -- don't add pair on that line
                  return false
                end
            end)
           }
        )
      '';
    };
    yanky = {
      enable = true;
      enableTelescope = true;
    };
    trouble.enable = true;
    barbecue.enable = true;
    undotree.enable = true;
    lualine = {
      enable = true;
      settings = {
        sections = {
          lualine_a = [ "branch" ];
          lualine_b = [
            {
              __unkeyed-1 = {
                __raw = ''
                  function()
                    return require('lsp-progress').progress()
                  end,
                '';
              };
            }
          ];
          lualine_c = [
            "progress"
            "filetype"
          ];
          lualine_x = [
            "encoding"
            "fileformat"
          ];
          lualine_y = [
            "diff"
            "diagnostics"
          ];
          lualine_z = [ "location" ];
        };
        options = {
          globalstatus = true;
          disabled_filetypes = [
            "ministarter"
          ];
          section_separators = {
            left = "";
            right = "";
          };
        };
      };
    };
    crates-nvim.enable = true;
    # git stuff
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
        };
      };
    };
    neogit = {
      enable = true;
      settings = {
        graph_style = "unicode";
        integrations = {
          diffview = true;
          telescope = true;
        };
      };
    };
    diffview.enable = true;

    # The greatest QoL plugin of all time. Renders codeblocks, formatting, etc
    # in LSP popup buffers too. GUI users will never flex on you with their
    # typesetting again!
    markdown-preview.enable = true;

    # Language specific tools
    ts-autotag.enable = true;
  };
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "satellite.nvim";
      src = inputs.satellite;
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "render-markdown.nvim";
      src = inputs.render-markdown;
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "lsp-progress.nvim";
      src = inputs.lsp-progress;
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "cellular-automaton.nvim";
      src = inputs.cellular-automaton;
    })
  ];
}
