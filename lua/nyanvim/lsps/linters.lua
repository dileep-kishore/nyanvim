require('lze').load {
  {
    'lint',
    event = 'BufWritePost',
    after = function()
      require('lint').linters_by_ft = {
        text = {},
        markdown = {},
        rst = { 'rstcheck', 'vale' },
        nix = { 'nix' },
        json = { 'jsonlint' },
        css = { 'stylelint' },
        scss = { 'stylelint' },
        dockerfile = { 'hadolint' },
        python = { 'ruff' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        svelte = { 'eslint_d' },
      }
    end,
  },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
