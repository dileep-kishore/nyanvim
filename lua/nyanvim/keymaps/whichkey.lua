require('lze').load {
  {
    'which-key.nvim',
    event = { 'DeferredUIEnter' },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
    after = function(_)
      local wk = require 'which-key'
      wk.setup { preset = 'helix' }
      wk.add {
        { '<Leader>a', group = '+Avante' },
        { '<leader>c', group = '+ChatGPT' },
        { '<leader>d', group = '+DAP' },
        { '<leader>f', group = '+File search' },
        { '<leader>g', group = '+Git' },
        { '<leader>h', group = '+Git hunk' },
        { '<leader>i', group = '+Iron' },
        { '<leader>l', group = '+LSP' },
        { '<leader>m', group = '+Arrow' },
        { '<leader>n', group = '+Literate Notes' },
        { '<leader>o', group = '+Obsidian' },
        { '<leader>p', group = '+Pos[session]' },
        { '<Leader>q', group = '+Close' },
        { '<leader>r', group = '+Refactor' },
        { '<leader>R', group = '+Auto-session' },
        { '<leader>s', group = '+Text search' },
        { '<leader>t', group = '+Snacks pickers' },
        { '<leader>T', group = '+Terminal' },
        { '<leader>u', group = '+Misc.' },
        { '<leader>x', group = '+Trouble' },
        { '<leader>z', group = '+Zen' },
        { '<leader>cd', desc = 'Diagnostics gpt' },
        { '<leader>cs', desc = 'Diagnostics search' },
        { '<leader>[', group = '+prev' },
        { '<leader>]', group = '+next' },
      }
    end,
  },
}
