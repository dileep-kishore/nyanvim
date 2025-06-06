require('rose-pine').setup {
  variant = 'main',
  dark_variant = 'main',
  dim_inactive_windows = false,
  extend_background_behind_borders = false,
  highlight_groups = {
    ['@type'] = { bold = true },
    ['@variable'] = { italic = false },
    ['@keyword'] = { italic = true },
    ['@keyword.conditional'] = { italic = true },
    ['@keyword.repeat'] = { italic = true },
    ['@function'] = { italic = true },
    ['@function.method.call'] = { italic = true },
    ['LeapBackdrop'] = { link = 'Comment' },
    ['@markup.raw'] = {
      fg = 'gold',
      bg = 'surface',
    },
    ModesCopy = { bg = 'gold' },
    ModesDelete = { bg = 'love' },
    ModesInsert = { bg = 'pine' },
    ModesVisual = { bg = 'iris' },
    MiniIndentscopeSymbol = { fg = 'foam' },
    MiniIndentscopeSymbolOff = { fg = 'foam' },
    EndOfBuffer = {
      fg = 'base',
      bg = 'base',
    },
    NotifyERRORBorder = {
      bg = 'base',
    },
    NotifyWARNBorder = {
      bg = 'base',
    },
    NotifyINFOBorder = {
      bg = 'base',
    },
    NotifyDEBUGBorder = {
      bg = 'base',
    },
    NotifyTRACEBorder = {
      bg = 'base',
    },
    NormalFloat = {
      bg = 'base',
    },
    Float = {
      bg = 'base',
    },
    Pmenu = {
      bg = 'base',
    },
    FloatBorder = {
      fg = 'highlight_high',
      bg = 'base',
    },
    CmpItemMenu = {
      fg = 'rose',
      bg = 'NONE',
      italic = true,
    },
    CmpItemKindCopilot = {
      fg = 'pine',
    },
    TelescopeBorder = {
      fg = 'overlay',
      bg = 'overlay',
    },
    TelescopeNormal = {
      fg = 'subtle',
      bg = 'overlay',
    },
    TelescopeSelection = {
      fg = 'text',
      bg = 'highlight_med',
    },
    TelescopeSelectionCaret = {
      fg = 'love',
      bg = 'highlight_med',
    },
    TelescopeMultiSelection = {
      fg = 'text',
      bg = 'highlight_high',
    },
    TelescopeTitle = {
      fg = 'base',
      bg = 'love',
    },
    TelescopePromptTitle = {
      fg = 'base',
      bg = 'pine',
    },
    TelescopePreviewTitle = {
      fg = 'base',
      bg = 'iris',
    },
    TelescopePromptNormal = {
      fg = 'text',
      bg = 'surface',
    },
    TelescopePromptBorder = {
      fg = 'surface',
      bg = 'surface',
    },
    TreeSitterContext = { bg = 'highlight_low' },
  },
}
