require('lze').load {
  {
    'smear-cursor.nvim',
    event = 'DeferredUIEnter',
    dep_of = { 'reactive-nvim' },
    after = function(_)
      local palette = require('catppuccin.palettes').get_palette 'mocha'
      local darken = require('catppuccin.utils.colors').darken
      require('smear_cursor').setup {
        stiffness = 0.8,
        trailing_stiffness = 0.5,
        stiffness_insert_mode = 0.6,
        trailing_stiffness_insert_mode = 0.6,
        distance_stop_animating = 0.5,
        cursor_color = darken(palette.yellow, 0.7),
      }
      -- vim.api.nvim_set_hl(0, 'ReactiveCursor', { bg = 'red' })
    end,
  },
}
