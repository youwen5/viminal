# Quality of life plugins
{ pkgs, inputs, ... }:
{
  extraPackages = with pkgs; [
    ripgrep
    yazi
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
    which-key.enable = true;
    nvim-autopairs.enable = true;
    yanky = {
      enable = true;
      enableTelescope = true;
    };
    trouble.enable = true;
    barbecue.enable = true;
    lualine = {
      enable = true;
      sections = {
        lualine_a = [ "branch" ];
        lualine_b = [ "diff" ];
        lualine_c = [
          # {
          #   __unkeyed-1 = {
          #     __raw = ''
          #       function()
          #         local bufnr = vim.api.nvim_get_current_buf()
          #
          #           local clients = vim.lsp.buf_get_clients(bufnr)
          #           if next(clients) == nil then
          #             return ""
          #           end
          #
          #           local c = {}
          #           for _, client in pairs(clients) do
          #             table.insert(c, client.name)
          #           end
          #           return '\u{f085} ' .. table.concat(c, '|')
          #       end
          #     '';
          #     icon = "";
          #   };
          # }
        ];
      };
      globalstatus = true;
    };
    crates-nvim.enable = true;
    # git stuff
    lazygit.enable = true;
    gitsigns.enable = true;
    # Language specific tools
    markdown-preview.enable = true;
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
  ];
}
