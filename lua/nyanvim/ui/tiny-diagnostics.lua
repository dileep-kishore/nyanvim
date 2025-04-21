require('lze').load {
  {
    'tiny-inline-diagnostic.nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('tiny-inline-diagnostic').setup {
        preset = 'powerline',
        options = {
          show_source = {
            enabled = false,
            if_many = false,
          },
          use_icons_from_diagnostic = false,
          multilines = { enabled = true, always_show = true },
        },
      }
    end,
  },
}
