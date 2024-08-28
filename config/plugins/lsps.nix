# LSP setup
{pkgs, ...}: {
  extraPackages = with pkgs; [
    rust-analyzer
    lua-language-server
  ];

  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      bashls.enable = true;
      clangd.enable = true;
      pyright.enable = true;
      nixd.enable = true;
      nushell.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true;
      # typst-lsp.enable = true;
      marksman.enable = true;
    };
  };
  plugins.typescript-tools.enable = true;
  plugins.lsp-lines.enable = true;
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "haskell-tools-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "mrcjkb";
        repo = "haskell-tools.nvim";
        rev = "959eac0fadbdd27442904a8cb363f39afb528027";
        hash = "sha256-5CS5kvUSqQJe7iFFpicinBjCQXgFPL0ElGgnrZHTT+Y=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "rustaceanvim";
      src = pkgs.fetchFromGitHub {
        owner = "mrcjkb";
        repo = "rustaceanvim";
        rev = "7cba8e599deca98d4b44cac1bcbd720c62937d90";
        hash = "sha256-OYfeJuo4FZUBdW9wGGCT0lZGYr/ur1uy8frcyUJMF3k=";
      };
    })
  ];
}
