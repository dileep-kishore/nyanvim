require('lze').load {
  {
    'arrow.nvim',
    -- event = { 'DeferredUIEnter' },
    after = function(_)
      require('arrow').setup {
        leader_key = '<leader>m',
        save_key = 'git_root',
        show_icons = true,
        always_show_path = false,
        separate_by_branch = true,
      }
    end,
  },
}
