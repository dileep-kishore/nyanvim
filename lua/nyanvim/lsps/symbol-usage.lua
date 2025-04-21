require('lze').load {
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

      local function text_format(symbol)
        local res = {}
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
