local config = {
  -- enable virtual text
  virtual_text = true,
  -- disable update while in insert mode
  update_in_insert = false,
  -- show signs
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}

vim.diagnostic.config(config)
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false,scope="cursor"})]]
