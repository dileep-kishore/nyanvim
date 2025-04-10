local servers = require 'nyanvim.lsps.servers'

require('lze').load {
  {
    'nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    after = function(_)
      local lspconfig = require 'lspconfig'
      lspconfig.util.default_config =
        vim.tbl_extend('force', lspconfig.util.default_config, {
          capabilities = require('blink.cmp').get_lsp_capabilities({}, true),
          on_attach = function(_, bufnr)
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
              require('conform').format { async = true }
            end, { desc = 'Format current buffer using conform' })
          end,
        })
      for server_name, cfg in pairs(servers) do
        lspconfig[server_name].setup(cfg or {})
      end
    end,
  },
  {
    'lazydev.nvim',
    cmd = { 'LazyDev' },
    ft = 'lua',
    after = function(_)
      require('lazydev').setup {
        library = {
          {
            words = { 'nixCats' },
            path = (nixCats.nixCatsPath or '') .. '/lua',
          },
        },
      }
    end,
  },
  -- TODO:  bashls, dockerls, eslint, gopls, jsonls, harper_ls, ltex, texlab, marksman, julials, ts_ls, rust_analyzer, svelte, tailwindcss, typst_lsp, cssls, html
}
