require('lze').load {
  {
    'blink.cmp',
    event = { 'DeferredUIEnter' },
    opts = {
      keymap = { preset = 'enter' },
    },
  },
  {
    'friendly-snippets',
    dep_of = { 'blink.cmp' },
  },
}
