local bufnr = vim.api.nvim_get_current_buf()
local map = vim.keymap.set

map('n', '<leader>ra', function() 
    vim.cmd.RustLsp('codeAction')
end, {buffer=bufnr})
