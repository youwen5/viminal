{ inputs, pkgs, ... }:
{
  plugins.typst-vim.enable = true;
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "typst-preview.nvim";
      src = inputs.typst-preview;
    })
  ];
}
