"
"
" ### Plugins
"
" Here are the list of plugins that are out-of-date.
" - `Vundle` (replaced by `vim-plug`)
"
"
set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""
" Loading the Plugs

call plug#begin('~/.vim/plug-plugins')

"Plug 'edkolev/tmuxline.vim'
"Plug 'bling/vim-bufferline'
"Plug 'vim-scripts/closetag.vim'
"Plug 'Shougo/vimfiler.vim'
"Plug 'Shougo/unite.vim'
"Plug 'd11wtq/ctrlp_bdelete.vim'
"Plug 'jeetsukumaran/vim-filebeagle'
"Plug 'google/vim-jsonnet'
"Plug 'justmao945/vim-clang'
"Plug 'kevinw/pyflakes-vim'
"Plug 'Valloric/YouCompleteMe'

" libraries
"Plug 'google/vim-maktaba'
"Plug 'google/vim-glaive'

" colorscheme
"Plug 'google/vim-colorscheme-primary'
Plug 'fatih/molokai'
"Plug 'justinmk/molokai'

" snippets
Plug 'SirVer/ultisnips'
Plug 'kaiserhl/vim-snippets'

" code checking
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kaiserhl/vim-StripWhiteSpaces'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Valloric/vim-operator-highlight'
Plug 'kana/vim-operator-user'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-characterize'
Plug 'vim-syntastic/syntastic'

" operations
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'mbriggs/mark.vim'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
"Plug 'tmhedberg/SimpylFold'
"Plug 'Konfekt/FastFold'

" coding
Plug 'kaiserhl/vim-a'
Plug 'sukima/xmledit'
"Plug 'vim-scripts/OmniCppComplete'
"Plug 'Shougo/neocomplete'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'

Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'scrooloose/nerdcommenter'

" lang
Plug 'Rip-Rip/clang_complete'
Plug 'Dinduks/vim-java-get-set'
Plug 'Chiel92/vim-autoformat'
"Plug 'rhysd/vim-clang-format'
"Plug 'fatih/vim-go'
"Plug 'mindriot101/vim-yapf'
"Plug 'google/vim-codefmt'

call plug#end()

""""""""""""""""""""""""""""""""""""""""

filetype on
filetype plugin on
filetype plugin indent on

syntax on
set t_Co=256
" XXX(lhe) resolving the vim color won't get displayed properly under tmux
if !has('nvim')
  if !has('gui_win32')
    set term=screen-256color
  endif
endif

"set background=dark
"colorscheme anotherdark

""" molokai
" XXX(lhe) make sure you disabled the blur and set term bgcolor to be the same
" color as molokai bgcolor
let g:molokai_original = 0
let g:rehash256 = 1
silent! colorscheme molokai

""" the leader key
let mapleader="\\"

""" disabling vim's autocomment;
" see http://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost
" set mouse=a " enable the use of the mouse
" set listchars=tab:>.,eol:\$ " strings to use in 'list' mode

set nohidden
set encoding=utf-8 " encoding using utf-8
set fileencodings=utf-8
set autoread " read open files again when changed outside Vim
set autowrite " write a modified buffer on each :next , ...
set noautoindent
set noshowmatch
set smartindent
set smarttab
set indentexpr=
set backspace=indent,eol,start " backspacing over everything in insert mode
set browsedir=current " which directory to use for the file browser
set formatoptions-=cro
set complete=.,w,b,u,t,k " scan the files used for autocomplete, no 'i'
set history=500
set undolevels=500
set wildignore=*.swp,*.bak,*.pyc,*.class,a.out
set hlsearch
set incsearch
set popt=left:8pc,right:3pc
set title
set visualbell
set noerrorbells
set nowrap
set ruler
set nu
set showcmd " display incomplete commands
set nolist
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu " command-line completion in an enhanced mode
set colorcolumn=80
set noswapfile
set nobackup
set binary " similar to `vim -b`
set foldmethod=marker

""" need for airline
set laststatus=2

""" gui
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

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
  autocmd BufRead,BufNewFile *.mdref set filetype=markdown_reference
  "
  autocmd BufRead,BufNewFile cpp,c set syntax=cpp11
  autocmd BufNewFile,BufRead,BufEnter *.cc,*.h set omnifunc=omni#cpp#complete#Main
  autocmd BufNewFile,BufRead,BufEnter *.html,*.css set omnifunc=htmlcomplete#CompleteTags
  "
  autocmd FileType c set ai sw=4 ts=4 fo=croql
  autocmd FileType asm set ai sw=4 ts=4 fo=croql
  "
  autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
  autocmd FileType cpp set ai sw=2 ts=2 et fo=croql
  autocmd FileType python set ai sw=4 ts=4 et fo=croql
  autocmd FileType go set ai sw=4 ts=4 fo=croql
  autocmd FileType sh set ai sw=2 ts=2 et fo=croql
  autocmd FileType zsh set ai sw=2 ts=2 et fo=croql
  autocmd FileType cmake set ai sw=2 ts=2 et fo=croql
  autocmd FileType make set ai sw=4 ts=4 fo=croql
  "
  autocmd FileType html set ai sw=2 ts=2 et fo=croql
  autocmd FileType css set ai sw=2 ts=2 et fo=croql
  autocmd FileType javascript set ai sw=2 ts=2 et fo=croql
  "
  autocmd FileType vim set ai sw=2 ts=2 et fo=croql
  autocmd FileType vim,tex let b:autoformat_autoindent=0
  autocmd FileType plaintex set ai sw=4 ts=4 et fo=croql
  "
  autocmd FileType markdown set ai sw=2 ts=2 et fo=croql
  autocmd FileType markdown_reference set ai sw=2 ts=2 et fo=croql
  autocmd FileType dot set ai sw=2 ts=2 et fo=croql
  autocmd FileType yaml set ai sw=2 ts=2 et fo=croql
  autocmd FileType xml set ai sw=2 ts=2 et fo=croql
  autocmd FileType json set ai sw=2 ts=2 et fo=croql
  autocmd FileType proto set ai sw=2 ts=2 et fo=croql
  autocmd FileType sql set ai sw=2 ts=2 et fo=croql
  autocmd FileType nginx set ai sw=2 ts=2 et fo=croql
  "
  autocmd FileType awk set ai sw=4 ts=4 et fo=croql
  autocmd FileType lua set ai sw=4 ts=4 et fo=croql
  "
  autocmd FileType dockerfile set ai sw=2 ts=2 et fo=croql
  autocmd FileType *.conf set ai sw=2 ts=2 et fo=croql
  "
  autocmd FileType java set ai sw=2 ts=2 et fo=croql
  autocmd BufEnter *.gradle set ai sw=4 ts=4 et fo=croql
augroup END

""" clang-format
"let g:clang_format#code_style = 'google'
"let g:clang_format#auto_format=1

""" yapf
"let g:yapf_style = "google"

""" autoformat
noremap <F4> :Autoformat<CR>
" let g:autoformat_verbosemode=1
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
let g:formatdef_c_clangformat = "'clang-format --style=\"{BasedOnStyle: LLVM, IndentWidth: 8, UseTab: Always, BreakBeforeBraces: Linux, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false}\"'"
let g:formatters_c = ['c_clangformat']
let g:formatdef_cpp_clangformat = "'clang-format --style=\"{BasedOnStyle: google}\" '"
let g:formatters_cpp = ['cpp_clangformat']
let g:formatdef_py_yapf = "'yapf --style google'"
let g:formatters_python = ['py_yapf']
let g:formatdef_sh_shfmt = "'shfmt'"
let g:formatters_sh= ['sh_shfmt']

""" clang-complete
let g:clang_library_path='/usr/lib64/libclang.so'

""" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

""" tagbar
noremap <silent> <F11> :TagbarToggle<CR>
inoremap <silent> <F11> :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 30
let g:tagbar_autofocus = 0
let g:tagbar_sort = 1
let g:tagbar_compact = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
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
    \ 'ctagsbin': 'gotags',
    \ 'ctagsargs': '-sort -silent'
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
"noremap <silent> <F10> :GundoToggle<CR>
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
"let g:OmniCpp_GlobalScopeSearch = 0
"let g:OmniCpp_NamespaceSearch = 1
"let g:OmniCpp_DisplayMode = 1 " always show all members
"let g:OmniCpp_ShowScopeInAbbr = 1
"let g:OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
"let g:OmniCpp_ShowAccess = 1 " show accessbility
"let g:OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let g:OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let g:OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let g:OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"let g:OmniCpp_LocalSearchDecl = 1 " user local search function
"set completeopt=menuone,longest,menu

""" DoxygenToolkit
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_compactDoc = "yes" " compact doxygen

""" Pyflakes
let g:pyflakes_use_quickfix = 0

""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#disable_refresh = 0
let g:airline#extensions#tabline#show_tabs = 0

""" UltiSnips TODO
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=grey
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 0

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
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
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
  \ " return %varname%; \n" .
  \ "}"
let b:javagetset_setterTemplate =
  \ "\n" .
  \ "%modifiers% void %funcname%(%type% %varname%) {\n" .
  \ " this.%varname% = %varname%; \n" .
  \ "}"
let b:javagetset_insertPosition = 2

""" vim-signature
let g:SignatureForceMarkerPlacement = 1
let g:SignatureForceMarkPlacement = 1

""" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_ignore_files = []
let g:syntastic_mode_map = { "mode": "passive" }
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'python'] }
"let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_c_checkers = ['splint']
"let g:syntastic_splint_config_file = ''
let g:syntastic_cpp_checkers = ['cpplint', 'cppcheck']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
"let g:syntastic_cpp_cpplint_thre = 5
"let g:syntastic_cpp_cpplint_args = '--verbose=3'
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--rcfile=~/.vim/etc/pylint.rc"
"let g:syntastic_python_python_exec = '/usr/bin/python2.7'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_sh_checkers = ['shellcheck']

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
let g:go_list_type = "quickfix"

""" StripWhiteSpaces
let g:auto_StripWhiteSpaces = 1

""" neocomlete
"let g:neocomplete#enable_at_startup = 1

""" vim-markdown-toc
let g:vmt_dont_insert_fence = 1

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

set exrc
set secure

""" https://git.zx2c4.com/password-store/tree/contrib/vim/noplaintext.vim
"
" Prevent various Vim features from keeping the contents of pass(1) password
" files (or any other purely temporary files) in plaintext on the system.
"
" Either append this to the end of your .vimrc, or install it as a plugin with
" a plugin manager like Tim Pope's Pathogen.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
"
" Don't backup files in temp directories or shm
if exists('&backupskip')
  set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif
" Don't keep swap files in temp directories or shm
if has('autocmd')
  augroup swapskip
    autocmd!
    silent! autocmd BufNewFile,BufReadPre
        \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
        \ setlocal noswapfile
  augroup END
endif
" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
  augroup undoskip
    autocmd!
    silent! autocmd BufWritePre
        \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
        \ setlocal noundofile
  augroup END
endif
" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
  if has('autocmd')
    augroup viminfoskip
      autocmd!
      silent! autocmd BufNewFile,BufReadPre
          \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
          \ setlocal viminfo=
    augroup END
  endif
endif
