require('lze').load {
  {
    'eyeliner.nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('eyeliner').setup {
        highlight_on_key = true,
        dim = true,
      }
    end,
  },
}
