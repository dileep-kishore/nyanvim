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
        show_dir_path_in_prompt = true,
      }
    end,
  },
  {
    'tabout.nvim',
    event = 'InsertCharPre',
    after = function(_)
      require('tabout').setup {}
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
    'nvim-spider',
    event = { 'DeferredUIEnter' },
    keys = {
      {
        'w',
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { 'n', 'o', 'x' },
      },
      {
        'e',
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { 'n', 'o', 'x' },
      },
      {
        'b',
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { 'n', 'o', 'x' },
      },
    },
    after = function(_)
      require('spider').setup {
        skipInsignificantPunctuation = true,
        subwordMovement = true,
      }
    end,
  },
}
