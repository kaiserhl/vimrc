
if has('win32') || has('win64') || has('win95') || has('win16')
  let s:uname = 'windows'
elseif has('win32unix')
  let s:uname = 'cygwin'
elseif has('unix')
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    let s:uname = 'linux'
  elseif v:shell_error == 0 && match(s:uname, 'Darwin') >= 0
    let s:uname = 'darwin'
  else
    let s:uname = 'posix'
  endif
else
  let s:uname = 'posix'
endif

""""""""""""""""""""""""""""""""""""""""
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:path(path)
  let path = expand(s:home . '/' . a:path )
  return substitute(path, '\\', '/', 'g')
endfunc


""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/.plugins')
  Plug 'tpope/vim-eunuch'
  Plug 'scrooloose/nerdtree'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-signify'
  Plug 'mbriggs/mark.vim'
  Plug 'kshenoy/vim-signature'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

  " Autoformat
  Plug 'sbdchd/neoformat'

  " colorscheme
  Plug 'fatih/molokai'

  " snippets
  "Plug 'SirVer/ultisnips'
  Plug 'kaiserhl/vim-snippets'

  " ctags
  Plug 'ludovicchabant/vim-gutentags'

  " asyncrun
  Plug 'skywind3000/asyncrun.vim'

  " Runtime code checks
  Plug 'w0rp/ale'

  " For text editing
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-syntax'
  Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
  Plug 'sgur/vim-textobj-parameter'

  " Coding
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-projectionist'

  " C++
  Plug 'octol/vim-cpp-enhanced-highlight', { 'for':['c', 'cpp'] }
  Plug 'Shougo/echodoc.vim', { 'for':['c', 'cpp'] }
  Plug 'mrtazz/DoxygenToolkit.vim', { 'for':['c', 'cpp'] }

  " Markdown
  Plug 'mzlogin/vim-markdown-toc', { 'for':['md'] }

  " XML
  Plug 'sukima/xmledit', { 'for':['html', 'xml'] }

  " Pending
  "Plug 'justinmk/vim-dirvish'

" operations
"Plug 'majutsushi/tagbar'
"Plug 'easymotion/vim-easymotion'
"Plug 'kien/ctrlp.vim'
"Plug 'ervandew/supertab'

" coding
"Plug 'kaiserhl/vim-a'
"Plug 'tpope/vim-surround'
"Plug 'dhruvasagar/vim-table-mode'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype plugin indent on

syntax on

""""""""""""""""""""
" resolving the vim color won't get displayed properly under tmux
set t_Co=256
if !has('nvim')
  if !has('gui_win32')
    set term=screen-256color
  endif
endif

""""""""""""""""""""
"set background=dark
"colorscheme anotherdark

""""""""""""""""""""
""" molokai
" make sure you disabled the blur and set term bgcolor to be the same
" color as molokai bgcolor
let g:molokai_original = 0
let g:rehash256 = 1
silent! colorscheme molokai

""""""""""""""""""""
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


""""""""""""""""""""
" the leader key
let mapleader="\\"

""""""""""""""""""""
" Disabling vim's autocomment;
" see http://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost
" set mouse=a " enable the use of the mouse
" set listchars=tab:>.,eol:\$ " strings to use in 'list' mode

""""""""""""""""""""
""" Always use utf-8
set encoding=utf-8 " encoding using utf-8
set fileencodings=utf-8

""""""""""""""""""""
set signcolumn=yes

""""""""""""""""""""
" https://www.zhihu.com/question/47691414/answer/373700711
set tags=./.tags;,.tags

""""""""""""""""""""
" https://www.zhihu.com/question/47691414/answer/373700711
set noshowmode

""""""""""""""""""""
set hlsearch
set incsearch

""""""""""""""""""""
set noautoindent
set smartindent
set indentexpr=

set nohidden
set autoread " read open files again when changed outside Vim
set autowrite " write a modified buffer on each :next , ...
set noshowmatch

set smarttab
set backspace=indent,eol,start " backspacing over everything in insert mode
set browsedir=current " which directory to use for the file browser
set formatoptions-=cro
set complete=.,w,b,u,t,k " scan the files used for autocomplete, no 'i'
set history=500
set undolevels=500
set wildignore=*.swp,*.bak,*.pyc,*.class,a.out
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

""""""""""""""""""""
""" need for airline
set laststatus=2

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

exec 'so '.fnameescape(s:home).'/custom.plugin/gutentags.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/asyncrun.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/LeaderF.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/ALE.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/NerdTreeToggle.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/DoxygenToolkit.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/airline.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/indent-guides.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/UltiSnips.vim'
exec 'so '.fnameescape(s:home).'/custom.plugin/markdown-toc.vim'

exec 'so '.fnameescape(s:home).'/custom.script/MkNonExDir.vim'
exec 'so '.fnameescape(s:home).'/custom.script/pass.vim'
exec 'so '.fnameescape(s:home).'/custom.script/map_leader.vim'
