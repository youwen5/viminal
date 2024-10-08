# LSP setup
{ pkgs, inputs, ... }:
{
  plugins = {
    lsp = {
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
        tinymist.enable = true;
        marksman.enable = true;
      };
    };
    typescript-tools.enable = true;
    lsp-lines.enable = true;
    rustaceanvim.enable = true;
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "haskell-tools-nvim";
      src = inputs.haskell-tools;
    })
  ];
}
