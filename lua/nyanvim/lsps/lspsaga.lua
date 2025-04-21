require('lze').load {
  {
    'lspsaga.nvim',
    event = 'LspAttach',
    after = function(_)
      require('lspsaga').setup {
        finder = {
          keys = {
            vsplit = 'v',
            split = 's',
            quit = 'q',
            toggle_or_open = '<CR>',
          },
        },
        ui = {
          border = 'rounded',
          code_action = '󰌶',
          kind = { Folder = { ' ' } },
        },
        beacon = { enable = true },
        implement = {
          enable = true,
          sign = false,
        },
        lightbulb = {
          enable = true,
          sign = true,
          virtual_text = false,
        },
        outline = {
          layout = 'float',
          keys = { toggle_or_jump = '<CR>' },
        },
        symbol_in_winbar = {
          enable = true,
          show_file = true,
          color_mode = false,
          separator = '  ',
        },
      }
    end,
  },
  {
    'vim-illuminate',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('illuminate').configure {
        under_cursor = false,
        delay = 1000,
        min_count_to_highlight = 2,
        filetypes_denylist = {
          'qf',
          'help',
          'grapple',
          'Trouble',
          'snacks_dashboard',
          'oil',
          'Outline',
        },
      }
    end,
  },
  {
    'symbol-usage-nvim',
    event = { 'BufReadPre' },
    keys = {
      {
        '<leader>lu',
        function()
          require('symbol-usage').toggle()
        end,
        desc = 'Toggle symbol usage',
      },
    },
    after = function(_)
      local symbol_usage = require 'symbol-usage'

      local function h(name)
        return vim.api.nvim_get_hl(0, { name = name })
      end

      local function text_format(symbol)
        local res = {}

        -- Indicator that shows if there are any other symbols in the same line
        local stacked_functions_content = symbol.stacked_count > 0
            and ('+%s'):format(symbol.stacked_count)
          or ''

        if symbol.references then
          local usage = symbol.references <= 1 and 'usage' or 'usages'
          local num = symbol.references == 0 and 'no' or symbol.references
          table.insert(res, { '󰌹 ', 'SymbolUsageRef' })
          table.insert(
            res,
            { ('%s %s'):format(num, usage), 'SymbolUsageContent' }
          )
        end

        if symbol.definition then
          if #res > 0 then
            table.insert(res, { ', ', 'Comment' })
          end
          table.insert(res, { '󰳽 ', 'SymbolUsageDef' })
          table.insert(
            res,
            { symbol.definition .. ' defs', 'SymbolUsageContent' }
          )
        end

        if symbol.implementation then
          if #res > 0 then
            table.insert(res, { ', ', 'Comment' })
          end
          table.insert(res, { '󰡱 ', 'SymbolUsageImpl' })
          table.insert(
            res,
            { symbol.implementation .. ' impls', 'SymbolUsageContent' }
          )
        end

        if stacked_functions_content ~= '' then
          if #res > 0 then
            table.insert(res, { ', ', 'Comment' })
          end
          table.insert(res, { ' ', 'SymbolUsageImpl' })
          table.insert(res, { stacked_functions_content, 'SymbolUsageContent' })
        end

        return res
      end

      symbol_usage.setup {
        text_format = text_format,
        references = { enabled = true, include_declaration = false },
        definition = { enabled = false },
        implementation = { enabled = true },
      }
    end,
  },
}
