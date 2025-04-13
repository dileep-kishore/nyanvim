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
  {
    'treesj',
    keys = {
      {
        'gs',
        '<cmd>lua require("treesj").toggle()<CR>',
        desc = 'Toggle treesj',
      },
    },
    after = function(_)
      require('treesj').setup {
        use_default_keymaps = false,
      }
    end,
  },
  {
    'img-clip.nvim',
    event = { 'DeferredUIEnter' },
    keys = {
      {
        '<leader>P',
        '<cmd>PasteImage<cr>',
        desc = 'Paste image from clipboard',
      },
    },
    after = function(_)
      require('img-clip').setup {}
    end,
  },
}
