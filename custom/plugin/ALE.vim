""""""""""""""""""""""""""""""""""""""""
" 'w0rp/ale'
"
" - https://www.zhihu.com/question/47691414/answer/373700711
"
"let g:ale_fixers = {
"\   'javascript': ['eslint'],
"\   'cpp': ['cppcheck'],
"\}
"let g:ale_linters_explicit = 1
"let g:ale_completion_delay = 500
"let g:ale_echo_delay = 20
"let g:ale_lint_delay = 500
"let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_insert_leave = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
      \ 'c': ['gcc', 'cppcheck'],
      \ 'cpp': ['gcc', 'cppcheck'],
      \ 'python': ['flake8', 'pylint'],
      \ 'lua': ['luac'],
      \ 'go': ['go build', 'gofmt'],
      \ 'java': ['javac'],
      \ 'javascript': ['eslint'],
      \ 'tex': ['alex'],
      \ }

function s:lintcfg(name)
  let path2 = expand('~/.vim/custom/etc/'. a:name)
  if filereadable(path2)
    return path2
  endif
  return shellescape(path2)
endfunc

let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
let g:ale_python_pylint_options .= ' --disable=W'
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

if executable('gcc') == 0 && executable('clang')
  let g:ale_linters.c += ['clang']
  let g:ale_linters.cpp += ['clang']
endif
