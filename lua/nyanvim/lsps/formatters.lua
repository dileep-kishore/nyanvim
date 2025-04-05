require('lze').load {
  {
    'conform.nvim',
    event = 'BufWritePre',
    cmd = { 'ConformInfo', 'ConformFormat' },
    keys = {
      {
        '<leader>lF',
        function()
          require('conform').format { async = true }
        end,
        mode = 'n',
        desc = 'Format buffer using conform',
      },
    },
    after = function(_)
      require('conform').setup {
        format_on_save = {
          timeout_ms = 500,
          lsp_format = 'fallback',
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          nix = { 'alejandra' },
          sh = { 'shfmt' },
          go = { 'gofumpt' },
          rust = { 'rustfmt' },
          python = { 'ruff_organize_imports', 'ruff_format' },
          javascript = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          svelte = { 'prettier' },
          css = { 'prettier' },
          scss = { 'prettier' },
          less = { 'prettier' },
          html = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'yamlfix', 'prettier' },
          markdown = { 'prettier' },
          typst = { 'typstfmt' },
          -- run formatters on filetypes that don't have other formatters configured.
          ['_'] = { 'trim_newlines', 'trim_whitespace' },
          -- Uncomment the following to run formatters on all filetypes.
          -- ["*"] = { "codespell" },
        },
      }
    end,
  },
}
