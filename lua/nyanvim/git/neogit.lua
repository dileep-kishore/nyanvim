require('lze').load {
  {
    'neogit',
    event = { 'DeferredUIEnter' },
    cmd = { 'Neogit' },
    keys = {
      { '<leader>gg', '<cmd>Neogit kind=floating<cr>', desc = 'Neogit' },
      { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Neogit commit' },
    },
    after = function(_)
      require('neogit').setup {
        commit_editor = { kind = 'floating' },
        integrations = { diffview = true },
      }
    end,
  },
}
