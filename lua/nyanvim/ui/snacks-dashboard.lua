local snacks = require 'snacks'
local M = {}

M.dashboard = {
  enabled = true,
  preset = {
    keys = {
      {
        icon = ' ',
        key = 'f',
        desc = 'Find File',
        action = ':lua Snacks.picker.files()',
      },
      {
        icon = ' ',
        key = 'n',
        desc = 'New File',
        action = ':ene | startinsert',
      },
      {
        icon = ' ',
        key = 'g',
        desc = 'Find Text',
        action = ':lua Snacks.picker.grep()',
      },
      {
        icon = ' ',
        key = 'p',
        desc = 'Find project',
        action = ':lua Snacks.picker.projects()',
      },
      {
        icon = ' ',
        key = 't',
        desc = 'Find todos',
        action = ':lua Snacks.picker.todo_comments()',
      },
      {
        icon = ' ',
        key = 'r',
        desc = 'Restore Session',
        action = ':SessionRestore',
      },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
    header = [[
                                                                             /\_/\                             
                                                                            ( o.o )                            
                                                                             > ^ <                             
                  ███▄▄▄▄   ▄██   ▄      ▄████████ ███▄▄▄▄    ▄█    █▄   ▄█     ▄▄▄▄███▄▄▄▄          
                  ███▀▀▀██▄ ███   ██▄   ███    ███ ███▀▀▀██▄ ███    ███ ███   ▄██▀▀▀███▀▀▀██▄        
                  ███   ███ ███▄▄▄███   ███    ███ ███   ███ ███    ███ ███▌  ███   ███   ███        
                  ███   ███ ▀▀▀▀▀▀███   ███    ███ ███   ███ ███    ███ ███▌  ███   ███   ███        
                  ███   ███ ▄██   ███ ▀███████████ ███   ███ ███    ███ ███▌  ███   ███   ███        
                  ███   ███ ███   ███   ███    ███ ███   ███ ███    ███ ███   ███   ███   ███        
                  ███   ███ ███   ███   ███    ███ ███   ███ ███    ███ ███   ███   ███   ███        
                   ▀█   █▀   ▀█████▀    ███    █▀   ▀█   █▀   ▀██████▀  █▀     ▀█   ███   █▀         
          ]],
  },
  formats = {
    key = function(item)
      return {
        { '[', hl = 'special' },
        { item.key, hl = 'key' },
        { ']', hl = 'special' },
      }
    end,
  },
  sections = {
    {
      section = 'header',
      indent = -5,
    },
    {
      -- icon = ' ',
      -- title = 'Builtin Actions',
      section = 'keys',
      gap = 1,
      padding = 1,
    },
    {
      text = '󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘 󰄛 󰄛 󰄛 󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘',
      padding = 1,
    },
    {
      -- icon = ' ',
      title = 'Recent Files',
      section = 'recent_files',
      padding = 1,
    },
    {
      -- icon = ' ',
      title = 'Projects',
      section = 'projects',
      padding = 1,
    },
    {
      -- icon = ' ',
      title = 'Git Status',
      section = 'terminal',
      enabled = function()
        return snacks.git.get_root() ~= nil
      end,
      cmd = 'git status --short --branch --renames',
      height = 5,
      padding = 1,
      ttl = 5 * 60,
    },
  },
}

return M
