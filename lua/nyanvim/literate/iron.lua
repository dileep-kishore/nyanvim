require('lze').load {
  {
    'iron.nvim',
    cmd = { 'IronRepl', 'IronSend', 'IronRestart' },
    keys = {
      {
        '<leader>ir',
        '<cmd>IronRepl<cr>',
        desc = 'Iron REPL',
      },
      {
        '<leader>ih',
        '<cmd>IronHide<cr>',
        desc = 'Iron Hide',
      },
    },
    after = function(_)
      local iron = require 'iron.core'
      local view = require 'iron.view'
      local common = require 'iron.fts.common'

      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = { command = { 'zsh' } },
            python = {
              command = { 'ipython', '--no-autoindent' },
              format = common.bracketed_paste_python,
            },
          },
          repl_open_cmd = view.bottom(20),
        },
        keymaps = {
          visual_send = '<space>ix',
          send_file = '<space>if',
          send_line = '<space>il',
          cr = '<space>i<cr>',
          interrupt = '<space>i<space>',
          exit = '<space>iq',
          clear = '<space>ic',
          restart_repl = '<space>iR',
        },
      }
    end,
  },
}
