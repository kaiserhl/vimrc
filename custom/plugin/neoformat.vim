" https://github.com/sbdchd/neoformat
"
" To debug:
" let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat

" ASM
let g:neoformat_enabled_asm = ['asmfmt']
let g:neoformat_asm_asmfmt = {
            \ 'exe': 'asmfmt',
            \ }"

" Bazel

" C
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_c_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style="{BasedOnStyle: Google}"'],
            \ }"

" C++
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style="{BasedOnStyle: Google}"'],
            \ }"

" CMake
let g:neoformat_enabled_cmake = ['cmakeformat']
let g:neoformat_cmake_cmakeformat = {
            \ 'exe': 'cmake-format',
            \ }"

" CSS
let g:neoformat_enabled_css = ['prettier']

" Go
let g:neoformat_enabled_go = ['gofmt', 'goimports']

" GraphQL

" HTML
let g:neoformat_enabled_html = ['prettier']

" Javascript
" https://medium.com/@dingvanmao/install-js-beautify-for-neoformat-b355e31a6233
"let g:neoformat_enabled_javascript = ['jsbeautify']
"let g:neoformat_javascript_jsbeautify = {
"        \ 'exe': 'jsbeautify',
"        \ 'args': ['-s 4', '-E'],
"        \ 'replace': 1,
"        \ 'stdin': 1,
"        \ 'env': ["DEBUG=1"],
"        \ 'valid_exit_codes': [0, 23],
"        \ 'no_append': 1
"        \ }
let g:neoformat_enabled_javascript = ['prettier']

" Latex

" Markdown
let g:neoformat_enabled_markdown = ['prettier']

" Proto
let g:neoformat_enabled_proto = ['clangformat']

" Python
let g:neoformat_enabled_python = ['yapf']
let g:neoformat_python_yapf = {
            \ 'exe': 'yapf',
            \ 'args': ['--style google'],
            \ }"

" Shell
let g:neoformat_enabled_sh = ['shfmt']

" SQL
let g:neoformat_enabled_sql = ['sqlfmt']
let g:neoformat_sql_sqlfmt = {
            \ 'exe': 'sqlfmt',
            \ 'args': ['-u'],
            \ }"

" Terraform

" YAML
let g:neoformat_enabled_yaml = ['pyaml']
let g:neoformat_yaml_pyaml = {
            \ 'exe': 'python3',
            \ 'args': ['-m', 'pyaml'],
            \ }"


let g:neoformat_run_all_formatters = 1

let g:neoformat_basic_format_retab = 0
let g:neoformat_basic_format_trim = 1
let g:neoformat_basic_format_align = 0
