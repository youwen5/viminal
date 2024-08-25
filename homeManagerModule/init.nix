# Basic housekeeping stuff that might run in a typical `init.lua` file.
{
  programs.nixvim = {
    colorschemes.rose-pine.enable = true;

    opts = {
      laststatus = 3;
      relativenumber = true;
      number = true;
    };
  };
}
