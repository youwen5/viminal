# Manual setup for some plugins
{
  extraConfigLua = ''
    require("telescope").load_extension("yank_history")
    require("telescope").load_extension("ht")
    vim.diagnostic.config({ virtual_lines = false });
  '';
}
