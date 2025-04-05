-- Helper function for key mappings
local function map(mode, key, action, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, key, action, options)
end

-- LSP (rename)
map(
  'n',
  '<Leader>lr',
  '<cmd>Lspsaga rename<cr>',
  { desc = 'Rename symbol (buffer)' }
)
map(
  'n',
  '<Leader>lR',
  '<cmd>Lspsaga lsp_rename ++project<cr>',
  { desc = 'Rename symbol (project-wide)' }
)

-- LSP (documentation generation)
map('n', '<Leader>lg', "<cmd>lua require('neogen').generate()<CR>", {
  desc = 'Generate documentation (neogen)',
})
