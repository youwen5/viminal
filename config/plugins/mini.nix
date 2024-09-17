# All the mini.nvim stuff
{ pkgs, ... }:
{
  plugins.mini = {
    enable = true;
    modules = {
      surround = { };
      ai = { };
      hipatterns = { };
      notify = {
        lsp_progress.enable = false;
      };
      tabline = { };
      trailspace = { };
      cursorword = { };
      bracketed = { };
      starter = { };
    };
    package = pkgs.vimPlugins.mini-nvim.overrideAttrs (oldAttrs: {
      postInstall =
        (oldAttrs.postInstall or "")
        + ''
          rm $out/doc/mini-git.txt
        '';
    });
  };
}
