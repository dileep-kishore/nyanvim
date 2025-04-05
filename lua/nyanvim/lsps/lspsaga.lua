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
          code_action = '󰌶',
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
          virtual_text = false,
        },
        outline = { layout = 'float' },
        keys = {
          toggle_or_open = '<CR>',
        },
        symbol_in_winbar = {
          enable = true,
          show_file = true,
          color_mode = false,
          separator = '  ',
        },
      }
    end,
  },
}
