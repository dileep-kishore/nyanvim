require('lze').load {
  {
    'better-escape.nvim',
    after = function(_)
      require('better_escape').setup {
        default_mappings = false,
        mappings = {
          c = { j = { k = '<Esc>' } },
          i = { j = { k = '<Esc>' } },
          s = { j = { k = '<Esc>' } },
          v = { j = { k = '<Esc>' } },
        },
      }
    end,
  },
  {
    'nvim-autopairs',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('nvim-autopairs').setup {
        check_ts = true,
      }
    end,
  },
}
