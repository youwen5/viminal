{
  imports = [
    ./plugins
    ./keymaps.nix
    ./init.nix
    ./autocmds.nix
  ];
  viAlias = true;
  vimAlias = true;
  withNodeJs = true;
  withRuby = true;

  luaLoader.enable = true;
  performance = {
    combinePlugins = {
      enable = true;
      standalonePlugins = [
        "nvim-treesitter"
      ];
    };
    byteCompileLua = {
      enable = true;
      plugins = true;
      nvimRuntime = true;
    };
  };
}
