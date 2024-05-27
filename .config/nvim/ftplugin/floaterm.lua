local map = vim.keymap.set

map('n', '<leader>`', ":FloatermToggle ~<CR>", {buffer = true})
map('t', 'kj', '<C-\\><C-n>', {buffer = true})
map('t', '<C-`>', '<cmd>FloatermToggle ~<CR>', {buffer = true})
map('t', '<C-h>', '<cmd>FloatermToggle ~<CR>', {buffer = true})
map('t', '<C-j>', '<cmd>FloatermUpdate --height=5 --position=bottom<CR><C-\\><C-n><C-w>p', {buffer = true})
map('t', '<C-k>', '<cmd>FloatermUpdate --height=0.6 --position=center<CR>', {buffer = true})
map('t', '<C-n>', '<cmd>FloatermNext<CR>', {buffer = true})
map('t', '<C-p>', '<cmd>FloatermPrev<CR>', {buffer = true})
map('t', '<C-q>', '<cmd>FloatermKill<CR>', {buffer = true})
map('t', '<C-w>', '<C-\\><C-n><C-w>', {buffer = true})
