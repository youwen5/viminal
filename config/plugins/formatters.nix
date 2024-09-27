# Code formatters
{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    # TS/JS, Markdown, TOML, JSON, etc
    nodePackages.prettier

    # Rust
    rustfmt

    # Nix
    nixfmt-rfc-style

    # Python
    black

    # Lua
    stylua

    # Haskell
    haskellPackages.fourmolu

    taplo

    typstyle
    # Misc
    # codespell
  ];

  plugins.conform-nvim = {
    enable = true;
    # because combinePlugins.enable = true, the collision of `doc` is
    # unavoidable. this renames them.
    package = pkgs.vimPlugins.conform-nvim.overrideAttrs (oldAttrs: {
      postInstall =
        (oldAttrs.postInstall or "")
        + ''
          mv $out/doc/recipes.md $out/doc/conform-nvim_recipes.md
        '';
    });
    # package = pkgs.vimPlugins.conform-nvim;
    settings = {
      # format_on_save = {
      #   timeoutMs = 500;
      #   lspFallback = true;
      # };
      format_on_save = # Lua
        ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            -- if slow_format_filetypes[vim.bo[bufnr].filetype] then
            --   return
            -- end
            --
            -- local function on_format(err)
            --   if err and err:match("timeout$") then
            --     slow_format_filetypes[vim.bo[bufnr].filetype] = true
            --   end
            -- end
            --
            -- return { timeout_ms = 500, lsp_fallback = true }, on_format
            return { timeout_ms = 500, lsp_fallback = true }
           end
        '';
      format_after_save = # Lua
        ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            -- if not slow_format_filetypes[vim.bo[bufnr].filetype] then
            --   return
            -- end

            return { lsp_fallback = true }
          end
        '';
      formatters_by_ft = {
        lua = [ "stylua" ];
        python = [ "black" ];
        nix = [ "nixfmt" ];
        svelte = [ "prettier" ];
        rust = [ "rustfmt" ];
        haskell = [ "fourmolu" ];
        toml = [ "taplo" ];
        json = [ "prettier" ];
        markdown = [ "prettier" ];
        yaml = [ "prettier" ];
        html = [ "prettier" ];
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        typst = [ "typstyle" ];
        # "*" = ["codespell"];
        "_" = [ "trim_whitespace" ];
      };
    };
  };
}
