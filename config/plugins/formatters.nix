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

    # Misc
    # codespell
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        timeoutMs = 500;
        lspFallback = true;
      };
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
        # "*" = ["codespell"];
        "_" = [ "trim_whitespace" ];
      };
    };
  };
}
