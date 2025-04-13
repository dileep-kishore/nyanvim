require('lze').load {
  {
    'snacks.nvim',
    after = function(_)
      local snacks = require 'snacks'
      local snacks_dashboard = require 'nyanvim.ui.snacks-dashboard'
      require 'nyanvim.ui.snacks-rename'

      snacks.setup {
        styles = {
          float = { wo = { winblend = 0 } },
          lazygit = {
            border = 'rounded',
            backdrop = false,
          },
          git = { backdrop = false },
        },
        bigfile = { enabled = true },
        gitbrowse = { enabled = true },
        lazygit = {
          enabled = true,
          win = { position = 'float' },
        },
        quickfile = { enabled = false },
        dashboard = snacks_dashboard.dashboard,
        notifier = {
          enabled = true,
          style = 'compact',
          timeout = 2500,
        },
        image = {
          enabled = true,
          doc = { inline = false, float = true },
        },
        statuscolumn = {
          enabled = false,
          left = { 'mark', 'sign' },
          right = { 'fold', 'git' },
          folds = { open = false, git_hl = true },
        },
        picker = {
          layouts = {
            custom = {
              preset = 'default',
              layout = { backdrop = false },
            },
            vscode_custom = {
              preset = 'vscode',
              layout = { border = 'rounded' },
            },
          },
          sources = {
            -- Snacks pickers (find) [f]
            files = { layout = { preset = 'custom' } },
            git_files = { layout = { preset = 'custom' } },
            buffers = { layout = { preset = 'dropdown' } },
            projects = { layout = { preset = 'vscode_custom' } },
            jumps = { layout = { preset = 'ivy' } },
            marks = { layout = { preset = 'ivy' } },

            -- Snacks pickers (git) [g]
            git_log = { layout = { preset = 'vertical' } },
            git_log_file = { layout = { preset = 'vertical' } },

            -- Snacks pickers (search) [s]
            grep = { layout = { preset = 'vertical' } },
            -- lines = {layout = {preset = "ivy"}},
            grep_buffers = { layout = { preset = 'vertical' } },
            todo_comments = { layout = { preset = 'vertical' } },

            -- Snacks pickers (misc) [t]
            command_history = { layout = { preset = 'vscode_custom' } },
            registers = { layout = { preset = 'vscode_custom' } },
            undo = { layout = { preset = 'dropdown' } },
            help = { layout = { preset = 'custom' } },
            highlights = { layout = { preset = 'dropdown' } },
            icons = { layout = { preset = 'vscode_custom' } },
            keymaps = { layout = { preset = 'vscode_custom' } },

            -- Snacks pickers (lsp) [l]
            diagnostics = { layout = { preset = 'vertical' } },
            lsp_symbols = { layout = { preset = 'custom' } },
          },
        },
      }
    end,
  },
}
