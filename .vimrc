" Swap files folder
if empty(glob('~/.vim/swapfiles'))
    execute "silent !mkdir -p ~/.vim/swapfiles"
endif
set directory=$HOME/.vim/swapfiles//

""" BASE CONFIGURATION
filetype plugin indent on
set foldmethod=syntax foldlevel=6
set expandtab tabstop=4 shiftwidth=4 mouse=a 
set hlsearch
set number relativenumber 
set backspace=indent,eol,start 
set nrformats-=octal 
set spell
set scrolloff=2 sidescrolloff=5 
set list listchars=tab:⇰\ ,trail:·,extends:→,precedes:←,nbsp:·,eol:↩

if $SHELL == "/bin/zsh"
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Work with screen
if match($TERM, "screen")!=-1
  set term=xterm
endif


" From https://www.youtube.com/watch?v=XA2WjJbmmoM&t=188s
syntax enable
set nocompatible path+=./** wildmenu
command! MakeTags !ctags -R .


""" PLUGINS
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')
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
    Plug 'tpope/vim-vividchalk'

    if has('nvim')
        Plug 'Olical/conjure'
        Plug 'radenling/vim-dispatch-neovim'
    endif
call plug#end()

" Plugin configuration

" let g:paredit_mode = 0 " Not currently used
let g:vimwiki_map_prefix = '<leader>ew'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'name': 'work'}, {'path': '~/personal/wiki/', 'syntax': 'markdown', 'ext': '.md', 'name': 'p'}, {'path': '~/personal/n/obsidian/', 'syntax': 'markdown', 'ext': '.md', 'name': 'o'}]

" COC settings
set hidden updatetime=300 shortmess+=c 

if has('nvim')
    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
else
    set signcolumn=number
endif


""" KEYBINDINGS


let mapleader = " "
let maplocalleader = "-"
inoremap kj <Esc>

if has('nvim')
tnoremap kj <C-\><C-N>
else
tnoremap kj <C-W>N
end

function! NTree()
    try
        " If we are in a wiki, open it to that directory
        execute ":NERDTree " . vimwiki#vars#get_wikilocal('path')
    catch
        execute ":NERDTree"
    endtry
endfunction

" (e)xtensions/plugins
nnoremap <leader>ecc :call ToggleCocCompletion()<CR>
nnoremap <leader>ech :call CocAction("doHover")<CR>
nnoremap <leader>eci :CocInstall 
nnoremap <silent> <leader>ecfd <Plug>(coc-definition)

nnoremap <leader>ei :PlugInstall<CR>
nnoremap <leader>etf :TagbarOpenAutoClose<CR>
nnoremap <leader>ett :TagbarToggle<CR>

" (f)ind
"
nnoremap <leader>fd <Plug>(coc-definition)
nnoremap <leader>fe <Plug>(coc-diagnostic-next)
nnoremap <leader>fE <Plug>(coc-diagnostic-prev)
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fF :tabnew .<CR>:Explore<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fi <Plug>(coc-implementation)
nnoremap <leader>ft <Plug>(coc-type-definition)
nnoremap <leader>fr <Plug>(coc-references)
nnoremap <leader>fw :VimwikiTabnewLink<CR>
" nnoremap <Leader>f<Tab> :call NTree()<CR>
nnoremap <leader>f<tab> :NERDTreeFind<CR>

" (s)ettings
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>s0 :set textwidth=0<CR>
nnoremap <leader>sf :set textwidth=79<CR>
nnoremap <leader>s, :tabnew ~/.vimrc<CR>
nnoremap <leader>s>2 :set shiftwidth=2 tabstop=2<CR>
nnoremap <leader>s>4 :set shiftwidth=4 tabstop=4<CR>
nnoremap <leader>s>8 :set shiftwidth=8 tabstop=8<CR>


" (r)efactor/(r)eposition
nnoremap <leader>rh :SidewaysLeft<cr>
nnoremap <leader>rl :SidewaysRight<cr>
nnoremap <leader>rj :m .+1<CR>==
nnoremap <leader>rk :m .-2<CR>==

nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-h> :SidewaysLeft<cr>
inoremap <c-l> :SidewaysRight<cr>
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv



" (v)iew
nnoremap <leader>vf :NERDTreeToggle<CR>

" (w)indow
nnoremap <leader>w <C-w>
nnoremap <leader>wf :NERDTreeFocus<CR>

" Special
nnoremap <leader>/ /<C-R>+<CR> 
nnoremap <leader>! 0"mD:!m
nnoremap <leader>% mm0"mYo<Esc>:read!python -c "print(m)"k"ndd`m

" COLOR SCHEME SETTINGS

colorscheme molokai_dark
hi CocErrorFloat ctermbg=88
hi CocWarningFloat ctermbg=130
hi CocFloating ctermfg=15

" COMMANDS

"" MY FUNCTIONS 

""" TEST CONFIG

""" VISUAL MAPPINGS
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
vnoremap , <Esc>
vnoremap <CR> <Esc>

" Do I still need these?
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile


if !empty(glob('~/.vimrc.local'))
    source '~/.vimrc.local'
endif
