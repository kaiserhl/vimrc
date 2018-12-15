" make sure you disabled the blur and set term bgcolor to be the same
"
"""""""""""""""""""""
" resolving the vim color won't get displayed properly under tmux
set t_Co=256
if !has('nvim')
  if !has('gui_win32')
    set term=screen-256color
  endif
endif
"
" color as molokai bgcolor
let g:molokai_original = 0
let g:rehash256 = 1
colorscheme molokai

""""""""""""""""""""
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
