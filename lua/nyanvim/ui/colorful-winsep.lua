require('lze').load {
  {
    'colorful-winsep-nvim',
    event = { 'WinLeave' },
    after = function(_)
      require('colorful-winsep').setup {
        symbols = { '─', '│', '┌', '┐', '└', '┘' },
      }
    end,
  },
}
