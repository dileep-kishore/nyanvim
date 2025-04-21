require('lze').load {
  {
    'wtf.nvim',
    event = 'DeferredUIEnter',
    keys = {
      {
        '<leader>cd',
        mode = { 'n', 'x' },
        function()
          require('wtf').ai()
        end,
        desc = 'Debug diagnostic with AI',
      },
      {
        mode = { 'n' },
        '<leader>cs',
        function()
          require('wtf').search()
        end,
        desc = 'Search diagnostic with Google',
      },
    },
    after = function(_)
      require('wtf').setup {
        context = true,
        openai_model_id = 'gpt-4.1-mini',
        popup_type = 'popup',
        search_engine = 'perplexity',
      }
    end,
  },
}
