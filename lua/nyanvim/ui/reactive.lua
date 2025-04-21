require('lze').load {
  {
    'reactive-nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('reactive').setup {
        load = {
          'catppuccin-mocha-cursor',
          'catppuccin-mocha-cursorline',
        },
      }
    end,
  },
}
