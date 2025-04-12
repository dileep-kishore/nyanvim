require('lze').load {
  {
    'nvim-dap',
    event = { 'DeferredUIEnter' },
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'nvim-dap-ui',
        'nvim-dap-virtual-text',
      }
    end,
    after = function(_)
      local dap = require 'dap'
      local dapui = require 'dapui'

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      require('nvim-dap-virtual-text').setup {
        enabled = true,
      }

      local sign_def = vim.fn.sign_define
      sign_def(
        'DapBreakpoint',
        { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' }
      )
      sign_def('DapBreakpointCondition', {
        text = '●',
        texthl = 'DapBreakpointCondition',
        linehl = '',
        numhl = '',
      })
      sign_def(
        'DapLogPoint',
        { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' }
      )
    end,
  },
  {
    'nvim-dap-python',
    on_plugin = 'nvim-dap',
    after = function(_)
      require('dap-python').setup 'python3'
    end,
  },
}
