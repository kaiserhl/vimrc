set nocompatible
filetype off

if ! exists('g:vimified_packages')
  let g:vimified_packages = ['general', ]
endif

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
if count(g:vimified_packages, 'general')
  "Bundle 'edkolev/tmuxline.vim'
  "Bundle 'bling/vim-bufferline'
  "Bundle 'vim-scripts/closetag.vim'
  "Bundle 'Shougo/vimfiler.vim'
  "Bundle 'Shougo/unite.vim'
  "Bundle 'nathanaelkane/vim-indent-guides'
  "Bundle 'd11wtq/ctrlp_bdelete.vim'
  "Bundle 'jeetsukumaran/vim-filebeagle'
  "Bundle 'google/vim-jsonnet'
  "Bundle 'justmao945/vim-clang'
  "Bundle 'kevinw/pyflakes-vim'
  "Bundle 'Valloric/YouCompleteMe'
  " libraries
  "Bundle 'google/vim-maktaba'
  "Bundle 'google/vim-glaive'
  " colorscheme
  "Bundle 'lightmanhk/vim-colorschemes'
  "Bundle 'google/vim-colorscheme-primary'
  Bundle 'fatih/molokai'
  "Bundle 'justinmk/molokai'
  " snippets
  Bundle 'SirVer/ultisnips'
  Bundle 'lightmanhk/vim-snippets'
  " code checking
  Bundle 'lightmanhk/StripWhiteSpaces'
  Bundle 'Valloric/vim-operator-highlight'
  Bundle 'kana/vim-operator-user'
  Bundle 'pangloss/vim-javascript'
  "Bundle 'scrooloose/syntastic'
  "Bundle 'google/vim-codefmt'
  " operations
  Bundle 'bling/vim-airline'
  Bundle 'scrooloose/nerdtree'
  Bundle 'mbriggs/mark.vim'
  Bundle 'kshenoy/vim-signature'
  Bundle 'majutsushi/tagbar'
  Bundle 'easymotion/vim-easymotion'
  Bundle 'tpope/vim-eunuch'
  Bundle 'kien/ctrlp.vim'
  " coding
  Bundle 'lightmanhk/a.vim'
  Bundle 'sukima/xmledit'
  "Bundle 'vim-scripts/OmniCppComplete'
  "Bundle 'Shougo/neocomplete'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-repeat'
  "
  Bundle 'mrtazz/DoxygenToolkit.vim'
  Bundle 'scrooloose/nerdcommenter'
  " lang
  "Bundle 'rhysd/vim-clang-format'
  "Bundle 'fatih/vim-go'
	Bundle 'Rip-Rip/clang_complete'
  Bundle 'Dinduks/vim-java-get-set'
  Bundle 'Chiel92/vim-autoformat'

  "Bundle 'mindriot101/vim-yapf'
  "Bundle 'lightmanhk/vim-python-tabindent'
endif

""" General Settings
syntax on
set t_Co=256

"set background=dark
"colorscheme anotherdark
"
""" molokai
" XXX(lhe) make sure you disabled the blur and set term bgcolor to be the same
" color as molokai bgcolor
let g:molokai_original = 0
let g:rehash256 = 1
colorscheme molokai

filetype on
filetype plugin on
filetype plugin indent on

let mapleader="\\"

" disabling vim's autocomment;
" see http://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost
" set mouse=a                     " enable the use of the mouse
" set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
"
set nohidden
set encoding=utf-8              " encoding using utf-8
set fileencodings=utf-8
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set noautoindent
set noshowmatch
set smartindent
set smarttab
set indentexpr=
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser
set formatoptions-=cro
set complete=.,w,b,u,t,k        " scan the files used for autocomplete, no 'i'
set history=500
set undolevels=500
set wildignore=*.swp,*.bak,*.pyc,*.class,a.out
set hlsearch
set incsearch
set popt=left:8pc,right:3pc     " print options
set title
set visualbell
set noerrorbells
set nowrap                      " do not wrap lines
set ruler                       " show the cursor position all the time
set nu                          " display line numbers
set showcmd                     " display incomplete commands
set nolist
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set colorcolumn=80
set noswapfile
set nobackup

set laststatus=2

""" pastt toggle
set pastetoggle=<F2>

""" match whole line
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

""" tabs to spaces
augroup common
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile cpp,c set syntax=cpp11
  autocmd BufNewFile,BufRead,BufEnter *.cc,*.h set omnifunc=omni#cpp#complete#Main
  autocmd BufNewFile,BufRead,BufEnter *.html,*.css set omnifunc=htmlcomplete#CompleteTags
  "autocmd BufWrite * :Autoformat
  autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
  autocmd FileType cpp set ai sw=2 ts=2 et fo=croql
  "autocmd FileType cpp ClangFormatAutoEnable
  "autocmd FileType cpp nnoremap <silent> <F4> :ClangFormat<CR>
  "autocmd FileType cpp vnoremap <silent> <F4> :ClangFormat<CR>
  autocmd FileType c set ai sw=4 ts=4 fo=croql
  autocmd FileType cmake set ai sw=2 ts=2 fo=croql
  autocmd FileType python set ai sw=4 ts=4 fo=croql
  autocmd FileType awk set ai sw=4 ts=4 fo=croql
  autocmd FileType go set ai sw=4 ts=4 fo=croql
  autocmd FileType lua set ai sw=4 ts=4 fo=croql
  autocmd FileType sh set ai sw=2 ts=2 fo=croql
  autocmd FileType zsh set ai sw=2 ts=2 fo=croql
  autocmd FileType make set ai sw=4 ts=4 fo=croql
  autocmd FileType markdown set ai sw=2 ts=2 et fo=croql
  autocmd FileType yaml set ai sw=2 ts=2 fo=croql
  autocmd FileType java set ai sw=2 ts=2 fo=croql
  autocmd FileType vim set ai sw=2 ts=2 fo=croql
  autocmd FileType vim,tex let b:autoformat_autoindent=0
  autocmd FileType xml set ai sw=2 ts=2 fo=croql
  autocmd FileType html set ai sw=2 ts=2 fo=croql
  autocmd FileType css set ai sw=2 ts=2 fo=croql
  autocmd FileType sh set ai sw=2 ts=2 fo=croql
  autocmd FileType sql set ai sw=2 ts=2 fo=croql
  autocmd FileType proto set ai sw=2 ts=2 fo=croql
  autocmd FileType plaintex set ai sw=4 ts=4 fo=croql
  autocmd FileType dot set ai sw=2 ts=2 fo=croql
  autocmd FileType javascript set ai sw=2 ts=2 fo=croql
  autocmd FileType html set ai sw=2 ts=2 fo=croql
  autocmd FileType svn set ai sw=2 ts=2 fo=croql
  autocmd FileType json set ai sw=2 ts=2 fo=croql
  autocmd FileType nginx set ai sw=2 ts=2 fo=croql
  autocmd FileType asm set ai sw=4 ts=4 fo=croql
  autocmd FileType sql set ai sw=2 ts=2 fo=croql
  autocmd BufEnter *.gradle set ai sw=4 ts=4 fo=croql
augroup END

""" clang-format
"let g:clang_format#code_style = 'google'
"let g:clang_format#auto_format=1

""" yapf
"let g:yapf_style = "google"

""" autoformat
noremap <F4> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatter_yapf_style = 'google'

"""
let g:clang_library_path='/usr/lib64/libclang.so'

""" tagbar
noremap <silent> <F11>  :TagbarToggle<CR>
inoremap <silent> <F11>  :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 30
let g:tagbar_autofocus = 0
let g:tagbar_sort = 1
let g:tagbar_compact = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

""" NerdTreeToggle
noremap <silent> <F12> :NERDTreeToggle<CR>
inoremap <silent> <F12> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowFiles = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMapJumpNextSibling = ""
let g:NERDTreeMapJumpPrevSibling = ""
let g:NERDTreeIgnore = ['\.pyc$[[file]]', '\.svn$[[dir]]', '\.class$[[file]]', '\.jar$[[file]]', '\.git$[[dir]]']

""" gundoToggle
"noremap  <silent> <F10> :GundoToggle<CR>
"inoremap <silent> <F10> :GundoToggle<CR>

""" ctags
set tags=./tags,tags
if has('win32') || has('win16')
elseif has('unix')
  augroup ctags_cxx
    autocmd!
    autocmd FileType c,cpp noremap <silent> <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
  augroup END
elseif has('mac')
  augroup ctags_cxx
    autocmd!
    autocmd FileType c,cpp noremap <silent> <F9> :!/opt/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
  augroup END
endif

""" vim-signature
let g:SignatureEnabledAtStartup = 1

""" OmniCPP complete
let g:OmniCpp_GlobalScopeSearch = 0
let g:OmniCpp_NamespaceSearch = 1
let g:OmniCpp_DisplayMode = 1           " always show all members
let g:OmniCpp_ShowScopeInAbbr = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1       " show function prototype in popup window
let g:OmniCpp_ShowAccess = 1            " show accessbility
let g:OmniCpp_MayCompleteDot = 1        " autocomplete with .
let g:OmniCpp_MayCompleteArrow = 1      " autocomplete with ->
let g:OmniCpp_MayCompleteScope = 1      " autocomplete with ::
let g:OmniCpp_SelectFirstItem = 2       " select first item (but don't insert)
let g:OmniCpp_LocalSearchDecl = 1       " user local search function
set completeopt=menuone,longest,menu

""" DoxygenToolkit
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_compactDoc = "yes" " compact doxygen

""" Pyflakes
let g:pyflakes_use_quickfix = 0

""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '

""" UltiSnips TODO
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=grey
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 1

""" ctrl-p
let g:ctrlp_map = '<c-l>'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15'
let g:ctrlp_switch_buffer = 'ehv'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class|pyc)$',
  \ }

  "\ 'AcceptSelection("t")': ['<cr>',],
  "\ 'AcceptSelection("h")': ['<c-cr>',],
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("t")': ['<cr>',],
  \ 'AcceptSelection("h")': ['<c-s>',],
  \ 'AcceptSelection("v")': ['<c-v>',],
  \ }
let g:ctrlp_cmd = 'CtrlPCurWD'

""" java-getset-vim
let b:javagetset_getterTemplate =
  \ "\n" .
  \ "%modifiers% %type% %funcname%() { \n " .
  \ "  return %varname%; \n" .
  \ "}"
let b:javagetset_setterTemplate =
  \ "\n" .
  \ "%modifiers% void %funcname%(%type% %varname%) {\n" .
  \ "  this.%varname% = %varname%; \n" .
  \ "}"
let b:javagetset_insertPosition = 2

""" vim-signature
let g:SignatureForceMarkerPlacement = 1
let g:SignatureForceMarkPlacement = 1

""" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_ignore_files = []
"let g:syntastic_python_python_exec = '/usr/bin/python2.7'
"let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
"nnoremap <F3> :SyntasticToggleMode<CR>

""" vim-go
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1 " enable fmt on save
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path = expand("~/bin/go")
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

""" StripWhiteSpaces
let g:auto_StripWhiteSpaces = 1

""" neocomlete
"let g:neocomplete#enable_at_startup = 1

""" create intermediate directories on the fly
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

""" google
""" From https://github.com/vim-scripts/google.vim/blob/master/indent/google.vim
"set cindent
"set cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
"set indentexpr=GoogleCppIndent()
"function! GoogleCppIndent()
  "let l:cline_num = line('.')

  "let l:orig_indent = cindent(l:cline_num)

  "if l:orig_indent == 0 | return 0 | endif

  "let l:pline_num = prevnonblank(l:cline_num - 1)
  "let l:pline = getline(l:pline_num)
  "if l:pline =~# '^\s*template' | return l:pline_indent | endif

  "" TODO: I don't know to correct it:
  "" namespace test {
  "" void
  "" ....<-- invalid cindent pos
  ""
  "" void test() {
  "" }
  ""
  "" void
  "" <-- cindent pos
  "if l:orig_indent != &shiftwidth | return l:orig_indent | endif

  "let l:in_comment = 0
  "let l:pline_num = prevnonblank(l:cline_num - 1)
  "while l:pline_num > -1
    "let l:pline = getline(l:pline_num)
    "let l:pline_indent = indent(l:pline_num)

    "if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
      "let l:in_comment = 1
    "elseif l:in_comment == 1
      "if l:pline =~ '/\*\(.\{-}\*/\)\@!'
        "let l:in_comment = 0
      "endif
    "elseif l:pline_indent == 0
      "if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
        "if l:pline =~# '^\s*namespace.*'
          "return 0
        "else
          "return l:orig_indent
        "endif
      "elseif l:pline =~# '\\$'
        "return l:orig_indent
      "endif
    "else
      "return l:orig_indent
    "endif

    "let l:pline_num = prevnonblank(l:pline_num - 1)
  "endwhile
  "return l:orig_indent
"endfunction

set exrc
set secure
