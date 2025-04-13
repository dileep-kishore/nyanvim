require('lze').load {
  {
    'modes-nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      local mocha = require('catppuccin.palettes').get_palette 'mocha'
      require('modes').setup {
        set_cursor = true,
        set_cursorline = true,
        set_number = true,
        set_signcolumn = true,
        colors = {
          copy = mocha.yellow,
          delete = mocha.red,
          insert = mocha.green,
          visual = mocha.mauve,
        },
      }
    end,
  },
}
