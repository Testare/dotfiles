local map = vim.keymap.set

-- Special
map('i', 'kj', '<Esc>', {})
map('n', '<leader>/', '/<C-R>+<CR>', {desc="Search for yanked text"})
map('n', '<leader>!', '0"mD:!<C-R>m<C-M>', {desc="Execute line on shell"})
map('n', '<leader>%', 'mm0"mYo<Esc>:read!python -c "print(<C-R>m)"<C-M>k"ndd`m', {desc="Execute code in python and print below"})
map('n', '<leader>`', '<cmd>FloatermToggle ~<CR><cmd>FloatermUpdate --height=0.6 --wintype=float --position=center<CR>', {desc="Open/focus primary floaterm terminal", silent = true})
map('n', '<leader>~', '<cmd>FloatermNew<CR><cmd>FloatermUpdate --height=0.6 --position=center<CR>', {desc="Open new floaterm terminal"})
map('n', '<leader><tab>', require("fzf-lua").buffers, {desc="Swap to another open buffer"})
map('n', '<leader>?', require("fzf-lua").keymaps, {desc="Search your keybindings"})
-- See ftplugin/floaterm.lua for more floaterm related bindings
map('n', '<leader>qf', '<cmd>copen<CR>', {desc="Open/focus quickfix"}) --?
map('n', '<leader>qF', '<cmd>cclose<CR>', {desc="Open/focus quickfix"}) --?

-- (d) DEBUG

local dap = require('dap')
map('n', '<leader>dB', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {desc="dap: Set breakpoint with message"})
map('n', '<leader>dCb', dap.clear_breakpoints, {desc="dap: Clear breakpoints"})
map('n', '<leader>dR', function() require('dap').repl_open() end, {desc="dap: Open debug repl"})
map('n', '<leader>dS', function() print("debug status: " .. require('dap').status()) end, {desc="dap: Print debug status"})
map('n', '<leader>db', dap.toggle_breakpoint, {desc="dap: Toggle breakpoint"})
map('n', '<leader>dc', dap.continue, {desc="dap: Start/continue debug session"})
map('n', '<leader>dC', dap.disconnect, {desc="dap: Disconnect debug session"})
map('n', '<leader>dff', dap.focus_frame, {desc="dap: Focus frame"})
map('n', '<leader>dl', dap.list_breakpoints, {desc="dap: List breakpoints"})
map('n', '<leader>dnd', dap.down, {desc="dap: Focus down stack track (no step)"})
map('n', '<leader>dnu', dap.up, {desc="dap: Focus up stack trace (no step)"})
map('n', '<leader>dq', dap.terminate, {desc="dap: Terminate debug session"})
map('n', '<leader>dr', dap.run_last, {desc="dap: Run last debug config"})
map('n', '<leader>dsi', dap.step_into, {desc="dap: Step into"})
map('n', '<leader>dso', dap.step_out, {desc="dap: Step out"})
map('n', '<leader>dss', dap.step_over, {desc="dap: Step over"})

-- (f) FIND

-- TODO Look into ripgrep plugin?
map('n', '<leader>ff', require("fzf-lua").files, {desc="Find files with fzf"})
map('n', '<leader>fF', require("fzf-lua").git_files, {desc = "Find git files with fzf"})
map('n', '<leader>fb', require("fzf-lua").buffers, {desc = "Find buffers with fzf"})
map('n', '<leader>fg', require("fzf-lua").grep_cWORD, {desc="grep current WORD"})
map('n', '<leader>fG', require("fzf-lua").live_grep, {desc="live grep"})
-- map('n', '<leader>fF', ':tabnew .<CR>:Explore<CR>', {})
-- map('n', '<leader>fg', ':GFiles<CR>', {})
map('n', '<leader>fr', vim.lsp.buf.references, {desc="Find references to item"})
map('n', '<leader>fi', vim.lsp.buf.implementation, {desc="Find item implementation"})
map('n', '<leader>fd', vim.lsp.buf.definition, {desc="Find item definition"})
map('n', '<leader>fD', vim.lsp.buf.type_definition, {desc="Find item type definition"})
-- map('n', '<leader>f<tab>', ':NERDTreeFind<CR>', {}) If I ever install a file tree plugin, this might be useful

-- (r) REFACTOR

map('n', '<leader>ra', vim.lsp.buf.code_action, {desc="Perform code action"})
map('n', '<leader>rn', vim.lsp.buf.rename, {desc="Refactor name"})

-- (s) SETTINGS

map('n', '<leader>ss', ':lua vim.o.spell= not vim.o.spell<CR>', {desc="Toggle spellcheck"})
map('n', '<leader>s0', ':lua vim.o.textwidth=0<CR>', {desc="Turn off textwidth enforcement"})
map('n', '<leader>sf', ':lua vim.otextwidth=79<CR>', {desc="Turn on textwidth enforcement"})
map('n', '<leader>s,', '<cmd>tabnew ~/.config/nvim<CR>', {desc="View config file"})
map('n', '<leader>s<', ':tabnew ~/.vimrc<CR>', {desc="View alternate config file"})

-- (t) Tabs
map('n', '<leader>tn', '<cmd>tabnew<CR>', {desc="Open new tab"})

-- (v) View

map('n', '<leader>vf', ':NERDTreeToggle<CR>', {desc="View files (not functional)"})
map('n', '<leader>vh', vim.lsp.buf.hover, {desc="View hover information"})
map('n', '<leader>vH', function() vim.diagnostic.open_float(nil, { focusable = false }) end)
map('n', '<leader>vtr', function() require'trouble'.toggle()  end, {desc="Toggle trouble bar"})
map('n', '<leader>vtb', ':TagbarToggle<CR>', {desc="Toggle tagbar"})

-- (w) WINDOW


map('n', '<leader>w', '<C-w>', {desc="Shortcut to window operations"})

-- OTHERS
-- CTRL movement

map('n', '<c-s-h>', ':SidewaysLeft<cr>', {})
map('n', '<c-s-l>', ':SidewaysRight<cr>', {})
map('n', '<c-s-j>', ':m .+1<CR>==', {})
map('n', '<c-s-k>', ':m .-2<CR>==', {})
map('i', '<c-s-h>', ':SidewaysLeft<cr>', {})
map('i', '<c-s-l>', ':SidewaysRight<cr>', {})
map('i', '<c-s-j>', '<Esc>:m .+1<CR>==gi', {})
map('i', '<c-s-k>', '<Esc>:m .-2<CR>==gi', {})
map('v', '<c-s-j>', ":m '>+1<CR>gv=gv", {})
map('v', '<c-s-k>', ":m '<-2<CR>gv=gv", {})
map('v', '<CR>', '<Esc>', {})
