""""""""""""""""""""""""""""""""""""""""
" asyncrun.vim
"
" - https://www.zhihu.com/question/47691414/answer/373700711
"
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
let g:asyncrun_open = 6
let g:asyncrun_bell = 1
" nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
" nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
" nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
" nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
" nnoremap <silent> <F5> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>
