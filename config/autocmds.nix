{
  autoCmd = [
    {
      command = "setlocal nonumber norelativenumber";
      event = [
        "TermOpen"
      ];
    }
    # {
    #   command = {
    #     __raw = ''
    #       require('typst-preview').update()
    #     '';
    #   };
    #   event = [
    #     "BufEnter"
    #     "BufWinEnter"
    #   ];
    #   pattern = [
    #     "*.typ"
    #   ];
    # }
  ];
}
