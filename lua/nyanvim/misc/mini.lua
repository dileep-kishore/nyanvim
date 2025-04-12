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
}
