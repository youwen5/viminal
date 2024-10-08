{ inputs, pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "typst-preview.nvim";
      src = inputs.typst-preview;
    })
  ];
}
