require('lze').load {
  {
    'mini.snippets',
    event = { 'DeferredUIEnter' },
    after = function(_)
      local gen_loader = require('mini.snippets').gen_loader
      require('mini.snippets').setup {
        snippets = {
          gen_loader.from_lang(),
        },
        mappings = {
          expand = '<C-j>',
          jump_next = '<C-l>',
          jump_prev = '<C-h>',
          stop = '<C-c>',
        },
      }
    end,
  },
}
