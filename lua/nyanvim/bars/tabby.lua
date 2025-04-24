local change_mark = function(tab)
  local already_marked = false
  return tab.wins().foreach(function(win)
    local bufnr = vim.fn.getwininfo(win.id)[1].bufnr
    local bufinfo = vim.fn.getbufinfo(bufnr)[1]
    if not already_marked and bufinfo.changed == 1 then
      already_marked = true
      return ' '
    else
      return ''
    end
  end)
end

local lsp_diag = function(buf)
  local diagnostics = vim.diagnostic.get(buf)
  local count = { 0, 0, 0, 0 }
  for _, diagnostic in ipairs(diagnostics) do
    count[diagnostic.severity] = count[diagnostic.severity] + 1
  end
  if count[1] > 0 then
    return vim.bo[buf].modified and '' or ''
  elseif count[2] > 0 then
    return vim.bo[buf].modified and '' or ''
  end
  return vim.bo[buf].modified and '' or ''
end

require('lze').load {
  {
    'tabby.nvim',
    event = { 'DeferredUIEnter' },
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'possession-nvim',
        'lspsaga.nvim',
      }
    end,
    after = function(_)
      local colors = require('catppuccin.palettes').get_palette 'mocha'

      local theme = {
        base = { fg = colors.base, bg = colors.base },
        fill = { fg = colors.base, bg = colors.base },
        head = { fg = colors.mantle, bg = colors.mauve, style = 'bold' },
        current_tab = { fg = colors.mantle, bg = colors.blue, style = 'bold' },
        tab = { fg = colors.overlay2, bg = colors.surface0, style = 'NONE' },
        win = { fg = colors.text, bg = colors.surface0 },
        tail = { fg = colors.base, bg = colors.mauve, style = 'bold' },
      }

      local function get_session_name()
        local session_name = require('possession.session').get_session_name()
        if session_name == nil then
          return ' 󱙃 '
        else
          return ' 󰆓 ' .. session_name
        end
      end

      local open_tabs = {}

      local tab_name = function(tab)
        local api = require 'tabby.module.api'
        local cur_win = api.get_tab_current_win(tab.id)
        if api.is_float_win(cur_win) then
          return '[Floating]'
        end
        local current_bufnr = vim.fn.getwininfo(cur_win)[1].bufnr
        local current_bufinfo = vim.fn.getbufinfo(current_bufnr)[1]
        local current_buf_name = vim.fn.fnamemodify(current_bufinfo.name, ':t')
        -- local no_extension = vim.fn.fnamemodify(current_bufinfo.name, ":p:r")

        if string.find(current_buf_name, 'NvimTree') ~= nil then
          return '[File Explorer]'
        end

        if current_buf_name == 'NeogitStatus' then
          return '[Neogit]'
        end

        if open_tabs[current_bufinfo.name] == nil then
          local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
          open_tabs[current_bufinfo.name] = project_name
        end

        if current_buf_name == '' then
          return '[Empty]'
        else
          if open_tabs[current_bufinfo.name] == nil then
            return current_buf_name
          end

          -- return open_tabs[current_bufinfo.name] .. ":" .. current_buf_name
          return current_buf_name
        end
      end

      local tab_count = function()
        local num_tabs = #vim.api.nvim_list_tabpages()

        if num_tabs >= 1 then
          local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
          return tabpage_number .. '/' .. tostring(num_tabs) .. ' '
        end
      end

      local window_count = function(tab)
        local api = require 'tabby.module.api'
        local win_count = #api.get_tab_wins(tab.id)
        -- return "[  " .. win_count .. " ]"
        return ' ' .. win_count
      end

      require('tabby.tabline').set(function(line)
        return {
          {
            {
              get_session_name(),
              hl = theme.head,
              margin = ' ',
            },
            line.sep(' 󰇝 ', theme.fill, theme.head),
            { '󰓩 ', hl = theme.head },
            { tab_count(), hl = theme.head },
            line.sep('▒', theme.head, theme.base),
            line.sep(' ', theme.head, theme.base),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              -- line.sep('', theme.fill, hl),
              -- line.sep(' ', theme.fill, hl),
              tab.is_current() and ' ' or ' ',
              -- tab.number(),
              tab_name(tab),
              window_count(tab),
              line.sep(' ', hl, theme.base),
              -- line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          hl = theme.base,
        }
      end, { buf_name = { mode = 'unique' } })
    end,
  },
}
