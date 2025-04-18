require('lze').load {
  {
    'mini.ai',
    after = function(_)
      require('mini.ai').setup {}
    end,
  },
  {
    'mini.animate',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('mini.animate').setup {
        cursor = { enable = true },
        scroll = { enable = true },
        resize = { enable = true },
        open = { enable = true },
        close = { enable = true },
      }
    end,
  },
  {
    'mini.basics',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('mini.basics').setup {
        options = { extra_ui = true },
        autocommands = {
          basic = true,
          relnum_in_visual_mode = false,
        },
      }
    end,
  },
  {
    'mini.files',
    keys = {
      {
        '<leader>/',
        '<cmd>lua MiniFiles.open()<CR>',
        desc = 'Open mini.files',
      },
    },
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('mini.files').setup {
        windows = { preview = true, width_preview = 60 },
        mappings = {
          go_in_plus = '<CR>',
          synchronize = '<C-s>',
        },
      }
    end,
  },
  {
    'mini.icons',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('mini.icons').setup {
        style = 'glpyh',
      }
    end,
  },
  {
    'mini.move',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('mini.move').setup {}
    end,
  },
  {
    'mini.operators',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('mini.operators').setup {
        exchange = { prefix = 'ge' },
        sort = { prefix = 'gS' },
      }
    end,
  },
  {
    'mini.surround',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('mini.surround').setup {
        respect_selection_type = true,
        search_method = 'cover_or_next',
      }
    end,
  },
}
