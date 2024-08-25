{pkgs, ...}: {
  imports = [./plugins ./keymaps.nix];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withRuby = true;

    luaLoader.enable = true;
    performance = {
      combinePlugins.enable = true;
      byteCompileLua.enable = true;
    };

    extraPackages = with pkgs; [
      ripgrep
      yazi
      fd
    ];
  };
}
