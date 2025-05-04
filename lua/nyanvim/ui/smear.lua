require('lze').load {
  {
    'smear-cursor.nvim',
    event = 'DeferredUIEnter',
    after = function(_)
      require('smear_cursor').setup {
        -- NOTE: Uncomment to enable the faster smear effect
        -- stiffness = 0.8,
        -- trailing_stiffness = 0.5,
        -- stiffness_insert_mode = 0.6,
        -- trailing_stiffness_insert_mode = 0.6,
        -- distance_stop_animating = 0.5,
      }
    end,
  },
}
