""""""""""""""""""""""""""""""""""""""""
" 'w0rp/ale'
"
" - https://www.zhihu.com/question/47691414/answer/373700711
"
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'cpp': ['cppcheck'],
\}
"let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
