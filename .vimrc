" Stuff I still haven't moved to neovim yet
" Work with screen, still necessary?
if match($TERM, "screen")!=-1
  set term=xterm
endif


" From https://www.youtube.com/watch?v=XA2WjJbmmoM&t=188s
set nocompatible path+=./** wildmenu
command! MakeTags !ctags -R .

if !empty(glob('$HOME/.vimrc.local.vim'))
    source "$HOME/.vimrc.local.vim"
endif
