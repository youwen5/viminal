# Manual setup for some plugins
{
  extraConfigLua = ''
    require("telescope").load_extension("yank_history")
    vim.diagnostic.config({ virtual_lines = false });
  '';
}
