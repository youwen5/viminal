# Basic housekeeping stuff that might run in a typical `init.lua` file.
{
  colorschemes.rose-pine.enable = true;

  opts = {
    # Global status/cmdline
    laststatus = 3;

    relativenumber = true;
    number = true;
    # sane defaults for tab/space
    shiftwidth = 2;
    tabstop = 4;
    # Crank up fold level so tree-sitter doesn't fold everything
    foldlevel = 15;
    # Persistent undos across sessions
    undofile = true;
  };
}
