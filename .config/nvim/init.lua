vim.g.mapleader = " "
vim.g.localleader = "-"
vim.loader.enable()
require("plugins")
require("rust_config")
vim.cmd("colorscheme vividchalk")
require("options")
require("keybinds")
pcall(function()
    vim.cmd("source " .. vim.fn.expand("~/.config/.local/nvim/localinit.lua"))
end)
