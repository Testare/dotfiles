nnoremap s< :tabnew ~/.config/nvim/init.vim
source /g/dot/vimrc
"
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
set noerrorbells visualbell
set clipboard=unnamedplus
set signcolumn=number

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
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } } " Why do I have two fzf plugins
    Plug 'airblade/vim-gitgutter'
    Plug 'Olical/conjure'

    Plug 'radenling/vim-dispatch-neovim'
    Plug 'elzr/vim-json'
    Plug 'clojure-vim/vim-jack-in'
    Plug 'justinmk/vim-sneak'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'preservim/nerdtree'
    Plug 'preservim/tagbar'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dispatch'
    " Color schemes
    Plug 'flazz/vim-colorschemes'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'tpope/vim-vividchalk'

call plug#end()

""" KEYBINDINGS

let mapleader = " "
let maplocalleader = "-"
inoremap kj <Esc>
tnoremap kj <C-\><C-N>

" (e)xtensions/plugins, obviously need to be replaced
nnoremap <leader>ecc :call ToggleCocCompletion()<CR>
nnoremap <leader>ech :call CocAction("doHover")<CR> 
nnoremap <leader>eci :CocInstall 
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

" (s)ettings
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>s0 :set textwidth=0<CR>
nnoremap <leader>sf :set textwidth=79<CR>
nnoremap <leader>s, :tabnew ~/.vimrc<CR>
nnoremap <leader>s>2 :set shiftwidth=2 tabstop=2<CR>
nnoremap <leader>s>4 :set shiftwidth=4 tabstop=4<CR>
nnoremap <leader>s>8 :set shiftwidth=8 tabstop=8<CR>

" (v)iew
nnoremap <leader>vf :NERDTreeToggle<CR>

" (w)indow
nnoremap <leader>w <C-w>

" Special
" Find yanked text
nnoremap <leader>/ /<C-R>+<CR> 
" Execute!
nnoremap <leader>! 0"mD:!m
" Evaluate line to cursor as python and print below
nnoremap <leader>% mm0"mYo<Esc>:read!python -c "print(m)"k"ndd`m

" Old
nnoremap <leader>,w :mksession! ~/.vim/session<CR>
nnoremap <leader>,r :source ~/.vim/session<CR>
nnoremap <leader>,W :mksession! ~/.vim/session2<CR>
nnoremap <leader>,R :source ~/.vim/session2<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"


" COLOR SCHEME SETTINGS

colorscheme molokai_dark

" COMMANDS

"" FILETYPE SPECIFIC SETTINGS

