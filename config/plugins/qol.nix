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
    guess-indent.enable = true;
    comment.enable = true;
    vim-bbye.enable = true;
    indent-blankline.enable = true;
    which-key = {
      enable = true;
      settings.delay = 1000;
    };
    nvim-autopairs.enable = true;
    yanky = {
      enable = true;
      enableTelescope = true;
    };
    trouble.enable = true;
    barbecue.enable = true;
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
        popup.kind = "floating";
      };
    };
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
