" https://github.com/sbdchd/neoformat

" C
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_c_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style="{BasedOnStyle: Google}"'],
            \ }"

" CPP
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style="{BasedOnStyle: Google}"'],
            \ }"

" GO
let g:neoformat_enabled_go = ['gofmt', 'goimports']

" PYTHON
let g:neoformat_enabled_python = ['yapf']
let g:neoformat_python_yapf = {
            \ 'exe': 'yapf',
            \ 'args': ['--style google'],
            \ }"

" SH
let g:neoformat_enabled_sh = ['shfmt']

" JS
let g:neoformat_enabled_javascript = ['jsbeautify']
" https://medium.com/@dingvanmao/install-js-beautify-for-neoformat-b355e31a6233
"let g:neoformat_javascript_jsbeautify = {
"        \ 'exe': 'jsbeautify',
"        \ 'args': ['-s 4', '-E'],
"        \ 'replace': 1,
"        \ 'stdin': 1,
"        \ 'env': ["DEBUG=1"],
"        \ 'valid_exit_codes': [0, 23],
"        \ 'no_append': 1
"        \ }
"let g:neoformat_enabled_javascript = ['js-beautify']
"let g:neoformat_basic_format_align = 1 " Enable alignment
"let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
"let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace

" Latex
" TODO

let g:neoformat_run_all_formatters = 1
