require('lze').load {
  {
    'neogit',
    event = { 'DeferredUIEnter' },
    cmd = { 'Neogit' },
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
      { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Neogit commit' },
    },
    after = function(_)
      require('neogit').setup {
        integrations = { diffview = true },
      }
    end,
  },
}
