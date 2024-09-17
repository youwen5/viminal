# All the mini.nvim stuff
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
    };
  };
}
