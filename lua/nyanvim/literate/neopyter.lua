vim.keymap.set(
  'n',
  '<leader>jc',
  '<cmd>Neopyter execute notebook:run-cell<cr>',
  { desc = 'run selected' }
)
vim.keymap.set(
  'n',
  '<leader>ja',
  '<cmd>Neopyter execute notebook:run-all-above<cr>',
  { desc = 'run all above cell' }
)
vim.keymap.set(
  'n',
  '<leader>jr',
  '<cmd>Neopyter execute kernelmenu:restart<cr>',
  { desc = 'restart kernel' }
)
vim.keymap.set(
  'n',
  '<leader>jA',
  '<cmd>Neopyter execute notebook:restart-run-all<cr>',
  { desc = 'restart kernel and run all' }
)

require('lze').load {
  {
    'neopyter',
    keys = {
      {
        '<leader>jc',
        '<cmd>Neopyter execute notebook:run-cell<cr>',
        mode = 'n',
        desc = 'run selected',
      },
      {
        '<leader>ja',
        '<cmd>Neopyter execute notebook:run-all-above<cr>',
        mode = 'n',
        desc = 'run all above cell',
      },
      {
        '<leader>jr',
        '<cmd>Neopyter execute kernelmenu:restart<cr>',
        mode = 'n',
        desc = 'restart kernel',
      },
      {
        '<leader>jA',
        '<cmd>Neopyter execute notebook:restart-run-all<cr>',
        mode = 'n',
        desc = 'restart kernel and run all',
      },
    },
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'plenary.nvim',
        'nvim-treesitter',
        'websocket.nvim',
      }
    end,
    after = function(_)
      require('neopyter').setup {
        mode = 'direct',
        remote_address = '127.0.0.1:9001',
        file_pattern = { '*.ju.*' },
      }
    end,
  },
}
