""""""""""""""""""""""""""""""""""""""""
" the key that binds to the map leader
"
" match whole line
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
