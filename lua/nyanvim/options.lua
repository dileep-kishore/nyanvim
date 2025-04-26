-- Clipboard settings
vim.opt.clipboard = { 'unnamedplus' }

-- General Neovim options
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = 'split'
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = 'cursor'
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.guifont = 'Maple Mono NF:h13'
vim.opt.listchars = { tab = '󰌒 ', trail = '•', nbsp = '␣' }
vim.opt.list = true
vim.opt.showbreak = '↪ '
vim.opt.foldnestmax = 20
vim.opt.foldminlines = 2
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.o.foldenable = true
vim.o.foldcolumn = '0'
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,stl:─]]

-- Always show tabline
vim.o.showtabline = 2
-- Save and restore tabpages
vim.opt.sessionoptions =
  'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
