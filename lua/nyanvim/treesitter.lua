require('lze').load {
  {
    'nvim-treesitter',
    event = 'DeferredUIEnter',
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'nvim-treesitter-textobjects',
        'treesitter-context',
      }
    end,
    after = function(_)
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true },
        indent = { enable = false },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = false,
            node_decremental = 'Backspace',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer', -- function
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer', -- class
              ['ic'] = '@class.inner',
              ['al'] = '@loop.outer', -- loop
              ['il'] = '@loop.inner',
              ['as'] = '@conditional.outer', -- conditionals
              ['is'] = '@conditional.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']f'] = '@function.outer',
              [']c'] = '@class.outer',
              [']l'] = '@loop.outer',
              [']s'] = '@conditional.outer',
              [']p'] = '@parameter.outer',
            },
            goto_next_end = {
              [']F'] = '@function.outer',
              [']C'] = '@class.outer',
              [']L'] = '@loop.outer',
              [']S'] = '@conditional.outer',
              [']P'] = '@parameter.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[c'] = '@class.outer',
              ['[l'] = '@loop.outer',
              ['[s'] = '@conditional.outer',
              ['[p'] = '@parameter.outer',
            },
            goto_previous_end = {
              ['[F'] = '@function.outer',
              ['[C'] = '@class.outer',
              ['[L'] = '@loop.outer',
              ['[S'] = '@conditional.outer',
              ['[P'] = '@parameter.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>pl'] = '@parameter.inner',
              desc = 'Swap next parameter',
            },
            swap_previous = {
              ['<leader>ph'] = '@parameter.inner',
              desc = 'Swap previous parameter',
            },
          },
        },
      }
      require('treesitter-context').setup {
        enable = true,
        max_lines = 0,
        mode = 'topline',
        separator = '-',
      }
    end,
  },
}

-- -- NOTE: This makes textobject moves repeatable
-- local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'
-- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)
