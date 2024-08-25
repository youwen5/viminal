# Quality of life plugins
{pkgs, ...}: {
  extraPackages = with pkgs; [
    ripgrep
    yazi
    fd
  ];

  plugins = {
    zen-mode.enable = true;
    direnv.enable = true;
    intellitab.enable = true;
    guess-indent.enable = true;
    vim-bbye.enable = true;
    indent-blankline.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    yanky = {
      enable = true;
      enableTelescope = true;
    };
    trouble.enable = true;
    crates-nvim.enable = true;
    # git stuff
    lazygit.enable = true;
    gitsigns.enable = true;
    # Language specific tools
    markdown-preview.enable = true;
  };
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "satellite.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "lewis6991";
        repo = "satellite.nvim";
        rev = "777ed56e1ef45ec808df701730b6597fc4fb0fbc";
        hash = "sha256-04Js+9SB4VuCq/ACbNh5BZcolu8i8vlGU72qo5xxfpk=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "render-markdown.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "MeanderingProgrammer";
        repo = "render-markdown.nvim";
        rev = "7986be47531d652e950776536987e01dd5b55b94";
        hash = "sha256-lc++IrXzEA3M2iUFZACAZOcH2EwVqX4p0fhET+en37o=";
      };
    })
  ];
}
