vim.g.mapleader = " "
vim.g.localleader = "-"
vim.loader.enable()
require("plugins")
require("rust_config")
vim.cmd("colorscheme vividchalk")
require("options")
require("keybinds")
