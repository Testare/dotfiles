local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Treesitter, AST parser for syntax highlighting
    {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "rust", },
          auto_install = false,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn", -- Consider changing these mapping or trying to move them to keybinds
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },
        })
    end
     }},
    -- FZF
    { "junegunn/fzf", build = "./install --bin" },
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
      end
    },

    -- LSP support
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "simrat39/rust-tools.nvim", -- TODO replace with: https://github.com/mrcjkb/rustaceanvim

     -- Debugger
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
    -- "jay-babu/mason-nvim-dap.nvim", -- Use Mason for Dap adapters. Might want to use in future

    -- Movement
    "AndrewRadev/sideways.vim", -- :SidewaysLeft + :SidewaysRight

    -- Completions
    "hrsh7th/nvim-cmp", -- Main completions library
    "hrsh7th/cmp-nvim-lsp", -- LSP completions
    "hrsh7th/cmp-nvim-lua", -- Other completions...
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",


    -- Color schemes
    "tpope/vim-vividchalk",

    -- Other
    "voldikss/vim-floaterm",
    "danilamihailov/beacon.nvim",
    "RRethy/vim-illuminate",
    "lukas-reineke/indent-blankline.nvim",
    "numToStr/Comment.nvim",
    "preservim/tagbar",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            auto_fold = true;
        },
    }

    -- UNDER REVIEW
    -- "Olical/conjure", -- Add keybinds
    -- {"nvim-telescope/telescope.nvim", tag = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" }},
    -- "smoka7/hop.nvim",
    -- "windwp/vim-floaterm-repl" -- Run markdown codeblocks in floaterm, compare to conjure
    -- "kyazdani42/nvim-tree.lua" -- Do I need a file tree? Is this better than nerdtree?
    -- https://github.com/windwp/nvim-autopairs
    -- SNIPPETS:
    -- "hrsh7th/vim-vsnip",
    -- "hrsh7th/cmp-vsnip",
    -- "nvim-telescope/telescope-file-browser.nvim"
}, {})

--[[ SEE HOW THESE PLUGINS STACK UP
    " Plug '/usr/local/opt/fzf'
    Plug 'AndrewRadev/sideways.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'clojure-vim/vim-jack-in'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'justinmk/vim-sneak'

    Plug 'udalov/kotlin-vim'
    Plug 'preservim/nerdtree'
    Plug 'preservim/tagbar'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-surround'
    Plug 'unblevable/quick-scope'
    Plug 'vimwiki/vimwiki'

    " Plugins to maybe try later
    " Plug 'tpope/vim-fugitive'
    " Plug 'svermeulen/vim-NotableFt'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'elzr/vim-json'
    " Plug 'kevinoid/vim-jsonc'
    " Plug 'ntpeters/vim-better-whitespace'
    " Plug 'Quramy/vim-js-pretty-template'
    " Plug 'craigemery/vim-autotag'
    " Plug 'airblade/vim-rooter'

    " Color schemes
    Plug 'flazz/vim-colorschemes'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'jdsimcoe/hyper.vim'

    if has('nvim')
        Plug 'Olical/conjure'
        Plug 'radenling/vim-dispatch-neovim'
    endif
--]]

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            -- package_installed = "",
            -- package_pending = "",
            -- package_uninstalled = "",
        },
    }
})
-- Run :MasonInstall rust-analyzer codelldb
require("mason-lspconfig").setup()
require("nvim-dap-virtual-text").setup({
    enabled = false -- TODO try this out
})
require("ibl").setup({
    enabled = true,
    scope = {
        enabled = true,
        show_start = false,
        show_end = false,
    }
}) -- For indent line
require('Comment').setup()
