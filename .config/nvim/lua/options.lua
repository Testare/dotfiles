local opt = vim.o

opt.clipboard   = "unnamedplus" -- TODO validate on both computers
-- opt.colorcolumn = "+1"
opt.conceallevel    = 1
opt.mouse       = "a" -- TODO Validate
opt.spell       = false -- TODO is there a way to use this only in the appropriate places?
opt.termguicolors   = true
opt.undofile    = true

opt.foldmethod  = "syntax"
opt.foldlevel   = 6
opt.foldmethod = 'expr' -- Use treesitter for folding
opt.foldexpr = 'nvim_treesitter#foldexpr()'

opt.expandtab   = true
opt.tabstop     = 4
opt.softtabstop = 4
opt.shiftwidth  = 4

opt.number      = true
opt.relativenumber  = true

opt.scrolloff   = 3
opt.sidescrolloff   = 5
opt.signcolumn  = "auto:2"

opt.splitright  = true
opt.splitbelow = true

opt.list        = true
opt.listchars   = "tab:⇰ ,trail:·,extends:→,precedes:←,nbsp:·,eol:↩"


vim.g.floaterm_opener   = "tabe"
vim.g.gitgutter_sign_priority   = 5 -- less than default

vim.lsp.set_log_level("debug")
vim.cmd("hi Beacon guibg=white") -- Used with beacon plugin
vim.cmd("hi def IlluminatedWordText gui=underline") -- Used with illuminate plugin
vim.cmd("hi def IlluminatedWordRead gui=underline")
vim.cmd("hi def IlluminatedWordWrite gui=underline")
vim.cmd("hi SignColumn guibg=black ctermbg=black")
vim.cmd("hi GitGutterAdd    guifg=#009900 guibg=black ctermfg=2 ctermbg=black")
vim.cmd("hi GitGutterChange guifg=#bbbb00 guibg=black ctermfg=3 ctermbg=black")
vim.cmd("hi GitGutterDelete guifg=#ff0000 guibg=black ctermfg=1 ctermbg=black")
