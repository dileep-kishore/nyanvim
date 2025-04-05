-- Helper function for key mappings
local function map(mode, key, action, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, key, action, options)
end

-- LSP (documentation generation)
map('n', '<Leader>lg', "<cmd>lua require('neogen').generate()<CR>")
