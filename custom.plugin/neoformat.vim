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
"let g:neoformat_enabled_javascript = ['js-beautify']

let g:neoformat_run_all_formatters = 1
