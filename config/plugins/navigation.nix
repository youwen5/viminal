# Getting around REALLY FAST
{
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        ui-select = {
          enable = true;
          settings = {
            codeactions = true;
          };
        };
        media-files = {
          enable = true;
          settings = {
            filetypes = [
              "png"
              "webp"
              "jpg"
              "jpeg"
              "mp4"
              "svg"
              "pdf"
              "mov"
              "mkv"
              "avi"
            ];
            find_cmd = "rg";
          };
          dependencies = {
            imageMagick.enable = true;
            pdftoppm.enable = true;
            ffmpegthumbnailer.enable = true;
          };
        };
      };
    };
    yazi = {
      enable = true;
      settings = {
        open_for_directories = true;
      };
    };
    harpoon = {
      enable = true;
      keymaps = {
        addFile = "<Leader>hh";
        cmdToggleQuickMenu = "<Leader>hm";
        gotoTerminal = {
          "1" = "<Leader>ht";
          "2" = "<Leader>2";
          "3" = "<Leader>3";
          "4" = "<Leader>4";
        };
        navFile = {
          "1" = "<Leader>ha";
          "2" = "<Leader>hs";
          "3" = "<Leader>hd";
          "4" = "<Leader>hf";
        };
        navNext = "<Leader>h]";
        navPrev = "<Leader>h[";
        toggleQuickMenu = "<Leader>hk";
      };
    };
  };
}
