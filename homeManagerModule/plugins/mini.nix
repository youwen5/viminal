# All the mini.nvim stuff
{
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      surround = {};
      ai = {};
      hipatterns = {};
      notify = {};
      tabline = {};
      trailspace = {};
      comment = {};
      cursorword = {};
      bracketed = {};
    };
  };
}
