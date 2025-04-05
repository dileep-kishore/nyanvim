require('lze').load {
  {
    'lspsaga.nvim',
    event = 'LspAttach',
    after = function(_)
      require('lspsaga').setup {
        finder = {
          keys = {
            vsplit = 'v',
            split = 's',
            quit = 'q',
            toggle_or_open = '<CR>',
          },
        },
        ui = {
          border = 'rounded',
          codeAction = '󰌶',
          kind = { Folder = { ' ' } },
        },
        beacon = { enable = true },
        implement = {
          enable = true,
          sign = false,
        },
        lightbulb = {
          enable = true,
          sign = true,
          virtualText = false,
        },
        outline = { layout = 'float' },
        keys = {
          toggle_or_open = '<CR>',
        },
        symbolInWinbar = {
          enable = true,
          showFile = true,
          colorMode = false,
          separator = '  ',
        },
      }
    end,
  },
}
