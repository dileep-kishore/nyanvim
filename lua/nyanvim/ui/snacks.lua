require('lze').load {
  {
    'snacks.nvim',
    after = function(_)
      local snacks = require 'snacks'
      local snacks_dashboard = require 'nyanvim.ui.snacks-dashboard'
      snacks.setup {
        dashboard = snacks_dashboard.dashboard,
      }
    end,
  },
}
