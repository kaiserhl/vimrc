""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides
"
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=grey
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 0
