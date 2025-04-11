require('lze').load {
  {
    'auto-session',
    after = function(_)
      require('auto-session').setup {
        auto_restore = false,
        auto_save = true,
        use_git_branch = true,
        auto_restore_last_session = false,
      }
    end,
  },
}
