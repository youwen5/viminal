# Code formatters
{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      # TS/JS
      nodePackages.prettier

      # Rust
      rustfmt

      # Nix
      alejandra

      # Python
      black

      # Lua
      stylua

      # Haskell
      haskellPackages.fourmolu

      # Misc
      codespell
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          timeoutMs = 500;
          lspFallback = true;
        };
        formatters_by_ft = {
          lua = ["stylua"];
          python = ["black"];
          nix = ["alejandra"];
          svelte = ["prettier"];
          rust = ["rustfmt"];
          haskell = ["fourmolu"];
          "*" = ["codespell"];
          "_" = ["trim_whitespace"];
        };
      };
    };
  };
}
