require('lze').load {
  {
    'better-escape.nvim',
    after = function(_)
      require('better_escape').setup {
        default_mappings = false,
        mappings = {
          c = { j = { k = '<Esc>' } },
          i = { j = { k = '<Esc>' } },
          s = { j = { k = '<Esc>' } },
          v = { j = { k = '<Esc>' } },
        },
      }
    end,
  },
  {
    'guess-indent.nvim',
    after = function(_)
      require('guess-indent').setup {
        auto_cmd = true,
        override_editorconfig = false,
      }
    end,
  },
  {
    'nvim-autopairs',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('nvim-autopairs').setup {
        check_ts = true,
      }
    end,
  },
  {
    'treesj',
    keys = {
      {
        'gs',
        '<cmd>lua require("treesj").toggle()<CR>',
        desc = 'Toggle treesj',
      },
    },
    after = function(_)
      require('treesj').setup {
        use_default_keymaps = false,
      }
    end,
  },
  {
    'img-clip.nvim',
    event = { 'DeferredUIEnter' },
    keys = {
      {
        '<leader>P',
        '<cmd>PasteImage<cr>',
        desc = 'Paste image from clipboard',
      },
    },
    after = function(_)
      require('img-clip').setup {
        default = {
          dir_path = 'assets',
          relative_to_current_file = false,
          show_dir_path_in_prompt = true,
        },
      }
    end,
  },
  {
    'vim-repeat',
  },
  {
    'outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      {
        'go',
        '<cmd>Outline<CR>',
        desc = 'Toggle Outline',
      },
    },
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'lspkind.nvim',
      }
    end,
    after = function(_)
      require('outline').setup {
        symbols = {
          icon_source = 'lspkind',
          filter = {
            default = { 'String', 'Variable', exclude = true },
          },
        },
        keymaps = {
          goto_location = 'e',
          peek_location = '<Cr>',
          fold = 'h',
          unfold = 'l',
          fold_toggle = 'o',
        },
      }
    end,
  },
  {
    'vim-tmux-navigator',
    event = { 'DeferredUIEnter' },
  },
  {
    'trouble.nvim',
    cmd = { 'Trouble', 'TroubleToggle' },
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>',
        desc = 'Trouble diagnostics toggle (buffer)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle focus=true<CR>',
        desc = 'Trouble diagnostics toggle',
      },
      {
        '<leader>xl',
        '<cmd>Trouble lsp toggle focus=true win.position=bottom<cr>',
        desc = 'Trouble LSP toggle',
      },
      { '<leader>xL', '<cmd>Trouble loclist<cr>', desc = 'Trouble loclist' },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=true win.position=bottom<cr>',
        desc = 'Trouble symbols toggle',
      },
      {
        '<leader>xq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Trouble qflist toggle',
      },
      {
        '<leader>xt',
        '<cmd>Trouble todo toggle filter.buf=0 focus=true<cr>',
        desc = 'Trouble todo toggle (buffer)',
      },
      {
        '<leader>xT',
        '<cmd>Trouble todo toggle focus=true<cr>',
        desc = 'Trouble todo toggle',
      },
    },
    after = function(_)
      require('trouble').setup {
        keys = {
          o = 'jump',
          ['<cr>'] = 'jump_close',
        },
      }
    end,
  },
  {
    'todo-comments.nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('todo-comments').setup {
        merge_keywords = true,
        gui_style = {
          bg = 'BOLD',
          fg = 'BOLD',
        },
        highlight = {
          before = '',
          after = '',
          keyword = 'wide_fg',
        },
        keywords = {
          QUESTION = { icon = '' },
        },
      }
    end,
  },
  {
    'refactoring.nvim',
    event = { 'DeferredUIEnter' },
    keys = {
      {
        '<leader>re',
        ':Refactor extract ',
        mode = 'x',
        desc = 'Extract function',
      },
      {
        '<leader>rf',
        ':Refactor extract_to_file ',
        mode = 'x',
        desc = 'Extract function to file',
      },
      {
        '<leader>rv',
        ':Refactor extract_var ',
        mode = 'x',
        desc = 'Extract variable',
      },
    },
    after = function(_)
      require('refactoring').setup {}
    end,
  },
  {
    'nvim-bqf',
    after = function(_)
      require('bqf').setup {
        auto_enable = true,
      }
    end,
  },
  {
    'marks.nvim',
    event = { 'DeferredUIEnter' },
    keys = {
      {
        '<leader>xm',
        '<cmd>MarksListBuf<CR>',
        desc = 'Quickfix marks (buffer)',
      },
      {
        '<leader>xM',
        '<cmd>MarksListAll<CR>',
        desc = 'Quickfix marks (all)',
      },
    },
    after = function(_)
      require('marks').setup {
        default_mappings = true,
      }
    end,
  },
  {
    'markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
  },
  {
    'cloak.nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('cloak').setup {
        enabled = true,
      }
    end,
  },
  {
    'git-conflict.nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('git-conflict').setup {
        default_commands = true,
        default_mappings = true,
      }
    end,
  },
  {
    'early-retirement-nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('early-retirement').setup {}
    end,
  },
  {
    'timber-nvim',
    event = { 'DeferredUIEnter' },
    keys = {
      {
        'gll',
        function()
          return require('timber.actions').insert_log {
            position = 'below',
            operator = true,
          } .. '_'
        end,
        desc = 'Insert below log statements the current line',
        mode = 'n',
        expr = true,
      },
      {
        'gls',
        function()
          require('timber.actions').insert_log {
            templates = { before = 'default', after = 'default' },
            position = 'surround',
          }
        end,
        mode = 'n',
        desc = 'Insert surround log statements below the current line',
      },
    },
    after = function(_)
      require('timber').setup {}
    end,
  },
  {
    'maximize-nvim',
    event = { 'DeferredUIEnter' },
    keys = {
      {
        '<leader>wm',
        '<cmd>Maximize<CR>',
        desc = 'Window maximize toggle',
      },
    },
    after = function(_)
      require('maximize').setup {}
    end,
  },
}
