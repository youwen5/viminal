{pkgs, ...}: {
  imports = [./plugins ./keymaps.nix ./init.nix];
  withNodeJs = true;
  withRuby = true;

  luaLoader.enable = true;
  performance = {
    combinePlugins.enable = true;
    byteCompileLua.enable = true;
  };
}
