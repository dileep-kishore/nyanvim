require('lze').load {
  {
    'nvim-treesitter',
    event = 'DeferredUIEnter',
    load = function(name)
      vim.cmd.packadd(name)
      vim.cmd.packadd 'nvim-treesitter-textobjects'
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
              ['ap'] = '@parameter.outer', -- argument
              ['ip'] = '@parameter.inner',
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
    end,
  },
}
